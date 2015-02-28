#!/bin/bash -eux

if [ "$AUTOLOGIN" != "true" ] && [ "$AUTOLOGIN" != "1" ]; then
  exit
fi

echo "Enabling automatic GUI login for the '$SSH_USERNAME' user.."

python /private/tmp/set_kcpassword.py "$SSH_PASSWORD"

/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser "$SSH_USERNAME"
