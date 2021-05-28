# Packer templates for macOS written in legacy JSON

### Overview

This repository contains [Packer](https://packer.io/) templates written in legacy JSON for creating
macOS Vagrant boxes.

You must supply your own install media and build these boxes on your own using
these templates. No pre-built boxes are publicly available.

## Creating macOS install images with the prepare_iso.sh script

First you will need to create custom install images of macOS in order
to automate the installation.  These images are made from official macOS
install media and customized so that they do not require human input to proceed
through the macOS install.

Start by downloading local copies of the install media for macOS. Either
download `Install OS X.app` from the App Store or the extract the
`InstallESD.dmg` for the version(s) of macOS you want to install.

You might want to extract an `InstallESD.dmg` file from the `Install OS X.app`
from the App Store if you store your installation media on a non-macOS
filesystem that does not understand the macOS `.app` package format.  You can
find the `InstallESD.dmg` file at the following location within the install
media package: `Contents/SharedSupport/InstallESD.dmg`.  Otherwise, just stick
with the original `Install OS X.app` file that you downloaded from the App
Store.

Once you have a `Install OS X.app` or `InstallESD.dmg` file for the version of
macOS you want to install, use the `prepare_iso.sh` script to create a custom
install image in the `dmg` subdirectory for packer.  For example, run following
to create a custom install image from the `Install OS X.app` for Mac OS X El
Capitan:

    sudo prepare_iso/prepare_iso.sh /Applications/Install\ OS\ X\ El\ Capitan.app dmg

Or if you extracted an `InstallESD.dmg` the command line is similar:

    sudo prepare_iso/prepare_iso.sh <path_to_installesd>/InstallESD.dmg dmg
    
The `prepare_iso.sh` script will prompt you for an administrator password.
Enter in the correct password, the script will automatically create a custom
install image for you.  The script will take a few minutes to grind through
the image creation process.  Once the script is complete, it will print out a
checksum and a relative path for the image location.  For example, this was
the output from `prepare_iso.sh` for my El Capitan image:

    ...
    -- Checksumming output image..
    -- MD5: 78abb8d18c4d8fc4436cac5394f58365
    -- Done. Built image is located at dmg/OSX_InstallESD_10.11_15A284.dmg. Add this iso and its checksum to your template.

## Customizing the var_list file

We make use of JSON files containing user variables to build specific versions
of macOS. You tell `packer` to use a specific user variable file via the
`-var-file=` command line option.  This will override the default options on
the core `macos.json` packer template.

Find the var_list file for the version of macOS you want to install, and
change the `iso_url` variable to match the image file name produced by
`prepare_iso.sh`.

## Building the Vagrant boxes with Packer

To build all the boxes, you will need [VirtualBox](https://www.virtualbox.org/wiki/Downloads), 
[VMware Fusion](https://www.vmware.com/products/fusion)/[VMware Workstation](https://www.vmware.com/products/workstation) and
[Parallels](http://www.parallels.com/products/desktop/whats-new/) installed.

Parallels requires that the
[Parallels Virtualization SDK for Mac](http://www.parallels.com/downloads/desktop)
be installed as an additional preqrequisite.

We make use of JSON files containing user variables to build specific versions
of macOS.  You tell `packer` to use a specific user variable file via the
`-var-file=` command line option.  This will override the default options on
the core `macos.json` packer template, which builds Mac OS X El Capitan by
default.

For example, to build Mac OS X El Capitan, use the following:

    $ packer build -var-file=macos1011.json macos.json
    
If you want to make boxes for a specific desktop virtualization platform, use
the `-only` parameter.  For example, to build Mac OS X El Capitan for VMware
Fusion:

    $ packer build -only=vmware-iso -var-file=macos1011.json macos.json

The boxcutter templates currently support the following desktop virtualization strings:

* `parallels-iso` - [Parallels](http://www.parallels.com/products/desktop/whats-new/) desktop virtualization (Requires the Pro Edition - Desktop edition won't work)
* `virtualbox-iso` - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) desktop virtualization
* `vmware-iso` - [VMware Fusion](https://www.vmware.com/products/fusion) or [VMware Workstation](https://www.vmware.com/products/workstation) desktop virtualization

## Building the Vagrant boxes with the box script

We've also provided a wrapper script `bin/box` for ease of use, so
alternatively, you can use the following to build Mac OS X El Capitan for
all providers:

    $ bin/box build macos1011 /Applications/Install\ OS\ X\ El\ Capitan.app/ 10.11

Or if you just want to build Mac OS X El Capitan for VMware Fusion:

    $ bin/box build osx1011 /Applications/Install\ OS\ X\ El\ Capitan.app/ 10.11 vmware

## Building the Vagrant boxes with the Makefile

A GNU Make `Makefile` drives a complete basebox creation pipeline with the following stages:

* `build` - Create basebox `*.box` files
* `assure` - Verify that the basebox `*.box` files produced function correctly
* `deliver` - Upload `*.box` files to [Artifactory](https://www.jfrog.com/confluence/display/RTF/Vagrant+Repositories), [Atlas](https://atlas.hashicorp.com/) or an [S3 bucket](https://aws.amazon.com/s3/)

The pipeline is driven via the following targets, making it easy for you to include them
in your favourite CI tool:

    make build   # Build all available box types
    make assure  # Run tests against all the boxes
    make deliver # Upload box artifacts to a repository
    make clean   # Clean up build detritus

### Proxy Settings

The templates respect the following network proxy environment variables
and forward them on to the virtual machine environment during the box creation
process, should you be using a proxy:

* http_proxy
* https_proxy
* ftp_proxy
* rsync_proxy
* no_proxy

### Tests

The tests are written in [Serverspec](http://serverspec.org) and require the
`vagrant-serverspec` plugin to be installed with:

    vagrant plugin install vagrant-serverspec

The `test-box` script will configure vagrant to run all the box tests.

    bin/box test osx1011 vmware

Similarly the `ssh-box` script will register a newly-built box with vagrant
and permit you to login to  perform exploratory testing.  For example, to do
exploratory testing on the VMware version of the box, run the following command:

    bin/box ssh osx1011 vmware
    make ssh-box/virtualbox/osx109-nocm.box
    
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

<img src="https://d79i1fxsrar4t.cloudfront.net/images/brand/smartystreets.65887aa3.png" width="320">
