#!/bin/bash -eux

if [[ "$UPDATE" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then

    echo "==> Running software update"
    softwareupdate --install --all -verbose

    echo "==> Rebooting the machine"
    reboot

fi
