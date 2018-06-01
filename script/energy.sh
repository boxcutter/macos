#!/bin/sh

echo "==> 'Disabling screensaver'"
defaults -currentHost write com.apple.screensaver idleTime 0
echo "==> 'Disabling login screensaver'"
defaults -currentHost write com.apple.screensaver loginWindowIdleTime 0
echo "==> 'Turning off energy saving'"
pmset -a displaysleep 0 disksleep 0 sleep 0
# https://carlashley.com/2016/10/19/com-apple-touristd/
echo "==> 'Disable New to Mac notification'"
defaults write com.apple.touristd seed-https://help.apple.com/osx/mac/10.12/whats-new -date "$(date)"
