#!/bin/sh

echo ==> 'Disabling screensaver'
defaults -currentHost write com.apple.screensaver idleTime 0
echo ==> 'Turning off energy saving'
pmset -a displaysleep 0 disksleep 0 sleep 0
