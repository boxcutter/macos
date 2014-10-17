# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "vagrant-osx1010-desktop"
    config.vm.box = "osx1010-desktop"
 
    ["vmware_fusion", "vmware_workstation"].each do |provider|
        config.vm.provider provider do |v, override|
            v.gui = true
            v.vmx["memsize"] = "2048"
            v.vmx["numvcpus"] = "1"
            v.vmx["firmware"] = "efi"
            v.vmx["keyboardAndMouseProfile"] = "macProfile"
            v.vmx["smc.present"] = "TRUE"
            v.vmx["hpet0.present"] = "TRUE"
            v.vmx["ich7m.present"] = "TRUE"
            v.vmx["ehci.present"] = "TRUE"
            v.vmx["usb.present"] = "TRUE"
            v.vmx["scsi0.virtualDev"] = "lsilogic"
        end
    end
end
