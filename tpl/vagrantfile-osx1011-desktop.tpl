# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.define "vagrant-osx1011-desktop"
    config.vm.box = "osx1011-desktop"
 
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

    config.vm.provider :virtualbox do |v, override|
      v.gui = true
      v.customize ["modifyvm", :id, "--audiocontroller", "hda"]
      v.customize ["modifyvm", :id, "--boot1", "dvd"]
      v.customize ["modifyvm", :id, "--boot2", "disk"]
      v.customize ["modifyvm", :id, "--chipset", "ich9"]
      v.customize ["modifyvm", :id, "--firmware", "efi"]
      v.customize ["modifyvm", :id, "--hpet", "on"]
      v.customize ["modifyvm", :id, "--keyboard", "usb"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--mouse", "usbtablet"]
      v.customize ["modifyvm", :id, "--usbehci", "on"]
      v.customize ["modifyvm", :id, "--vram", "16"]
      v.customize ["modifyvm", :id, "--name", "IDE Controller", "--remove"]
    end

    config.vm.provider :parallels do |v, override|
      v.customize ["set", :id, "--memsize", "2048"]
      v.customize ["set", :id, "--memquota", "512:2048"]
      v.customize ["set", :id, "--cpus", "2"]
      v.customize ["set", :id, "--distribution", "macosx"]
      v.customize ["set", :id, "--3d-accelerate", "highest"]
      v.customize ["set", :id, "--high-resolution", "off"]
      v.customize ["set", :id, "--auto-share-camera", "off"]
      v.customize ["set", :id, "--auto-share-bluetooth", "off"]
      v.customize ["set", :id, "--on-window-close", "keep-running"]
      v.customize ["set", :id, "--isolate-vm", "on"]
      v.customize ["set", :id, "--shf-host", "off"]
    end
end
