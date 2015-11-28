# Packer templates for Mac OS X

### Overview

This repository contains [Packer](https://packer.io/) templates for creating Mac OS X Vagrant boxes.

You must supply your own install media and build these boxes on your own using these templates.
No pre-built boxes are publicly available.

## Current Boxes

* osx1011 - El Capitan headless, VMware 7.8GB
* osx1010 - Yosemite headless, VMware 7.4GB
* osx109 - Mavericks headless, VMware 8.7GB
* osx108 - Mountain Lion headless, VMware 7.4GB
* osx107 - Lion headless, VMware 8.6GB
* osx1011-desktop - El Capitan desktop, VMware 7.8GB
* osx1010-desktop - Yosemite desktop, VMware 7.4GB
* osx109-desktop - Mavericks desktop, VMware 8.1GB
* osx108-desktop - Mountain Lion desktop, VMware 7.4GB
* osx107-desktop - Lion desktop, VMware 8.5GB

## Creating Mac OS X install images with the prepare_iso.sh script

First you will need to create custom install images of Mac OS X in order
to automate the installation.  These images are made from official Mac OS X
install media and customized so that they do not require human input to proceed
through the Mac OS X install.

Start by downloading local copies of the install media for Mac OS X. Either download
`Install OS X.app` from the App Store or the extract the `InstallESD.dmg`
for the version(s) of Mac OS X you want to install.

You might want to extract an `InstallESD.dmg` file from the `Install OS X.app` from
the Mac OS X App Store if you store your installation media on a non-Mac OS X filesystem
that does not understand the Mac OS X `.app` package format.  You can find the
`InstallESD.dmg` file at the following location within the install media package: `Contents/SharedSupport/InstallESD.dmg`

Otherwise, just stick with the original `Install OS X.app` file that you downloaded from
the Mac OS X App Store.

Once you have a `Install OS X.app` or `InstallESD.dmg` file for the version of Mac OS X
you want to install, use the `prepare_iso.sh` script to create a custom install
image in the `dmg` subdirectory for packer.  For example, run following to create a
custom install image from the `Install OS X.app` for Mac OS X El Capitan:

    sudo prepare_iso/prepare_iso.sh /Applications/Install\ OS\ X\ El\ Capitan.app dmg

Or if you extracted an `InstallESD.dmg` the command line is similar:

    sudo prepare_iso/prepare_iso.sh <path_to_dmg>/InstallESD.dmg dmg

## Building the Vagrant boxes with Packer

To build all the boxes, you will need [VirtualBox](https://www.virtualbox.org/wiki/Downloads), 
[VMware Fusion](https://www.vmware.com/products/fusion)/[VMware Workstation](https://www.vmware.com/products/workstation) and
[Parallels](http://www.parallels.com/products/desktop/whats-new/) installed.

Parallels requires that the
[Parallels Virtualization SDK for Mac](http://www.parallels.com/downloads/desktop)
be installed as an additional preqrequisite.


We make use of JSON files containing user variables to build specific versions of Ubuntu.
You tell `packer` to use a specific user variable file via the `-var-file=` command line
option.  This will override the default options on the core `ubuntu.json` packer template,
which builds Ubuntu 14.04 by default.

For example, to build Ubuntu 15.04, use the following:

    $ packer build -var-file=ubuntu1504.json ubuntu.json
    
If you want to make boxes for a specific desktop virtualization platform, use the `-only`
parameter.  For example, to build Ubuntu 15.04 for VirtualBox:

    $ packer build -only=virtualbox-iso -var-file=ubuntu1504.json ubuntu.json

The boxcutter templates currently support the following desktop virtualization strings:

* `parallels-iso` - [Parallels](http://www.parallels.com/products/desktop/whats-new/) desktop virtualization (Requires the Pro Edition - Desktop edition won't work)
* `virtualbox-iso` - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) desktop virtualization
* `vmware-iso` - [VMware Fusion](https://www.vmware.com/products/fusion) or [VMware Workstation](https://www.vmware.com/products/workstation) desktop virtualization
* 
## Building the Vagrant boxes

To build all the boxes, you will need VirtualBox, VMware Fusion and 
Parallels Desktop for Mac installed.

Parallels requires that the
[Parallels Virtualization SDK for Mac](http://www.parallels.com/downloads/desktop)
be installed as an additional preqrequisite.

You will also need copies on the install media for Mac OS X. Either the
`Install OS X.app` downloaded from the App Store or the `InstallESD.dmg`
extracted from the for the version(s) of Mac OS X you want to install.

You can find the `InstallESD.dmg` file at the following location within
the install media package: `Contents/SharedSupport/InstallESD.dmg`

By default, the install media files are expected to be in the following
relative path locations (but can be overridden as they are Makefile variables):

| Mac OS X Release   | Makefile variable                      | Default Value |
| ------------------ | ---------------------------------------| --------------|
| 10.11 El Capitan   | `MAC_OSX_10_11_EL_CAPITAN_INSTALLER`   | `iso/Install\ OS\ X\ El\ Capitan.app` |
| 10.10 Yosemite     | `MAC_OSX_10_10_YOSEMITE_INSTALLER`     | `iso/Install\ OS\ X\ Yosemite.app` |
| 10.9 Mavericks     | `MAC_OSX_10_9_MAVERICKS_INSTALLER`     | `iso/OS\ X\ Mavericks/Install\ OS\ X\ Mavericks.app` |
| 10.8 Mountain Lion | `MAC_OSX_10_8_MOUNTAIN_LION_INSTALLER` | `iso/OS\ X\ Mountain\ Lion/Install\ OS\ X\ Mountain\ lion.app` |
| 10.7 Lion          | `MAC_OSX_10_7_LION_INSTALLER`          | `iso/OS\ X\ Lion/Install\ OS\ X\ Lion.app` |

You can also override these setting, such as with:
`MAC_OSX_10_11_EL_CAPITAN_INSTALLER := file:///Volumes/macosx/Install\ OS\ X\ El\ Capitan.app`
`MAC_OSX_10_10_YOSEMITE_INSTALLER := file:///Volumes/macosx/yosemite/InstallESD.dmg`

A GNU Make `Makefile` drives the process via the following targets:

    make        # Build all the box types (VMware & VirtualBox)
    make test   # Run tests against all the boxes
    make list   # Print out individual targets
    make clean  # Clean up build detritus
    
### Tests

The tests are written in [Serverspec](http://serverspec.org) and require the
`vagrant-serverspec` plugin to be installed with:

    vagrant plugin install vagrant-serverspec
    
The `Makefile` has individual targets for each box type with the prefix
`test-*` should you wish to run tests individually for each box.

Similarly there are targets with the prefix `ssh-*` for registering a
newly-built box with vagrant and for logging in using just one command to
do exploratory testing.  For example, to do exploratory testing
on the VirtualBox training environmnet, run the following command:

    make ssh-box/virtualbox/osx109-nocm.box
    
Upon logout `make ssh-*` will automatically de-register the box as well.

### Makefile.local override

You can create a `Makefile.local` file alongside the `Makefile` to override
some of the default settings.  It is most commonly used to override the
default configuration management tool, for example with Chef:

    # Makefile.local
    CM := chef

Changing the value of the `CM` variable changes the target suffixes for
the output of `make list` accordingly.

Possible values for the CM variable are:

* `nocm` - No configuration management tool
* `chef` - Install Chef
* `chefdk` - Install Chef Development Kit
* `puppet` - Install Puppet
* `salt`  - Install Salt

You can also specify a variable `CM_VERSION`, if supported by the
configuration management tool, to override the default of `latest`.
The value of `CM_VERSION` should have the form `x.y` or `x.y.z`,
such as `CM_VERSION := 11.12.4`

Another use for `Makefile.local` is to override the default locations
for the Mac OS X installer files.

## Contributing

1. Fork and clone the repo.
2. Create a new branch, please don't work in your `master` branch directly.
3. Add new [Serverspec](http://serverspec.org/) or [Bats](https://blog.engineyard.com/2014/bats-test-command-line-tools) tests in the `test/` subtree for the change you want to make.  Run `make test` on a relevant template to see the tests fail (like `make test-vmware/osx109`).
4. Fix stuff.  Use `make ssh` to interactively test your box (like `make ssh-vmware/osx109`).
5. Run `make test` on a relevant template (like `make test-vmware/osx109`) to see if the tests pass.  Repeat steps 3-5 until done.
6. Update `README.md` and `AUTHORS` to reflect any changes.
7. If you have a large change in mind, it is still preferred that you split them into small commits.  Good commit messages are important.  The git documentatproject has some nice guidelines on [writing descriptive commit messages](http://git-scm.com/book/ch5-2.html#Commit-Guidelines).
8. Push to your fork and submit a pull request.
9. Once submitted, a full `make test` run will be performed against your change in the build farm.  You will be notified if the test suite fails.

### Acknowledgments

These templates are based on [Timothy Sutton's Mac OS X templates](https://github.com/timsutton/osx-vm-templates).
We thank Timothy for making these templates available and keeping them updated.

[Parallels](http://www.parallels.com/) provides a Business Edition license of
their software to run on the basebox build farm.

<img src="http://www.parallels.com/fileadmin/images/corporate/brand-assets/images/logo-knockout-on-red.jpg" width="80">

[SmartyStreets](http://www.smartystreets.com) is providing basebox hosting for the box-cutter project.

![Powered By SmartyStreets](https://smartystreets.com/resources/images/smartystreets-flat.png)
