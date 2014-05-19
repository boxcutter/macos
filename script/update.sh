#!/bin/bash -eux

[[ ! $INSTALL_UPDATES ]] && exit

echo "==> Running software update"
softwareupdate --install --all -v

echo "==> Rebooting the machine"
reboot
