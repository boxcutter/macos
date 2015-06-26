#!/bin/sh
date > /etc/box_build_time
OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')

# Set computer/hostname
COMPNAME=osx-10_${OSX_VERS}
scutil --set ComputerName ${COMPNAME}
scutil --set HostName ${COMPNAME}.vagrantup.com

# Packer passes boolean user variables through as '1', but this might change in
# the future, so also check for 'true'.
if [ "$INSTALL_VAGRANT_KEYS" = "true" ] || [ "$INSTALL_VAGRANT_KEYS" = "1" ]; then
	echo "Installing vagrant keys for $SSH_USERNAME user"
	mkdir "/Users/$SSH_USERNAME/.ssh"
	chmod 700 "/Users/$SSH_USERNAME/.ssh"
	curl -L 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' > "/Users/$SSH_USERNAME/.ssh/authorized_keys"
	chmod 600 "/Users/$SSH_USERNAME/.ssh/authorized_keys"
	chown -R "$SSH_USERNAME" "/Users/$SSH_USERNAME/.ssh"
fi

# Create a group and assign the user to it
dseditgroup -o create "$SSH_USERNAME"
dseditgroup -o edit -a "$SSH_USERNAME" "$SSH_USERNAME"

if [ "$OSX_VERS" = "11" ]; then
	nvram boot-args=rootless=0
	reboot
fi
