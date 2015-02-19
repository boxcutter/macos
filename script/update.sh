#!/bin/bash -eux

if [[ $UPDATE  =~ true || $UPDATE =~ 1 || $UPDATE =~ yes ]]; then

    echo "==> Running software update"
    softwareupdate --install --all -v

    echo "==> Rebooting the machine"
    reboot

fi
