#!/bin/bash -eux

[[ ! $UPDATE ]] && exit

echo "==> Running software update"
softwareupdate --install --all -v

echo "==> Rebooting the machine"
reboot
