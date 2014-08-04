# if Makefile.local exists, include it
ifneq ("$(wildcard Makefile.local)", "")
	include Makefile.local
endif

MAC_OSX_10_7_LION_INSTALLER ?= iso/OS\ X\ Lion/InstallESD.dmg
MAC_OSX_10_8_MOUNTAIN_LION_INSTALLER ?= iso/OS\ X\ Mountain\ Lion/InstallESD.dmg
MAC_OSX_10_9_MAVERICKS_INSTALLER ?= iso/OS\ X\ Mavericks/Install\ OS\ X\ Mavericks.app

MAC_OSX_10_7_LION_BOOT_DMG ?= OSX_InstallESD_10.7_11A511.dmg
MAC_OSX_10_8_MOUNTAIN_LION_BOOT_DMG ?= OSX_InstallESD_10.8_12A269.dmg
MAC_OSX_10_9_MAVERICKS_BOOT_DMG ?= OSX_InstallESD_10.9_13A603.dmg

# Possible values for CM: (nocm | chef | chefdk | salt | puppet)
CM ?= nocm
# Possible values for CM_VERSION: (latest | x.y.z | x.y)
CM_VERSION ?=
ifndef CM_VERSION
	ifneq ($(CM),nocm)
		CM_VERSION = latest
	endif
endif
INSTALL_UPDATES ?=
INSTALL_XCODE_CLI_TOOLS ?=
# Packer does not allow empty variables, so only pass variables that are defined
ifdef CM_VERSION
	PACKER_VARS := -var 'cm=$(CM)' -var 'cm_version=$(CM_VERSION)' -var 'update=$(UPDATE)' -var 'install_xcode_cli_tools=$(INSTALL_XCODE_CLI_TOOLS)'
else
	PACKER_VARS := -var 'cm=$(CM)' -var 'update=$(UPDATE)' -var 'install_xcode_cli_tools=$(INSTALL_XCODE_CLI_TOOLS)'
endif
ifeq ($(CM),nocm)
	BOX_SUFFIX := -$(CM).box
else
	BOX_SUFFIX := -$(CM)$(CM_VERSION).box
endif
BUILDER_TYPES := vmware
TEMPLATE_FILENAMES := $(wildcard *.json)
BOX_FILENAMES := $(TEMPLATE_FILENAMES:.json=$(BOX_SUFFIX))
BOX_FILES := $(foreach builder, $(BUILDER_TYPES), $(foreach box_filename, $(BOX_FILENAMES), box/$(builder)/$(box_filename)))
TEST_BOX_FILES := $(foreach builder, $(BUILDER_TYPES), $(foreach box_filename, $(BOX_FILENAMES), test-box/$(builder)/$(box_filename)))
VMWARE_BOX_DIR := box/vmware
VMWARE_OUTPUT := output-vmware-iso
VMWARE_BUILDER := vmware-iso
CURRENT_DIR := $(shell pwd)
SOURCES := $(wildcard script/*.sh)

.PHONY: all list validate clean test

all: $(BOX_FILES)

test: $(TEST_BOX_FILES)

###############################################################################
# Target shortcuts
define SHORTCUT

vmware/$(1): $(VMWARE_BOX_DIR)/$(1)$(BOX_SUFFIX)

test-vmware/$(1): test-$(VMWARE_BOX_DIR)/$(1)$(BOX_SUFFIX)

ssh-vmware/$(1): ssh-$(VMWARE_BOX_DIR)/$(1)$(BOX_SUFFIX)

$(1): vmware/$(1)

test-$(1): test-vmware/$(1)

endef

SHORTCUT_TARGETS := osx109 osx108 osx107
$(foreach i,$(SHORTCUT_TARGETS),$(eval $(call SHORTCUT,$(i))))

###############################################################################

dmg/$(MAC_OSX_10_7_LION_BOOT_DMG): $(MAC_OSX_10_7_LION_INSTALLER)
	mkdir -p dmg
	sudo prepare_iso/prepare_iso.sh $(MAC_OSX_10_7_LION_INSTALLER) dmg

dmg/$(MAC_OSX_10_8_MOUNTAIN_LION_BOOT_DMG): $(MAC_OSX_10_8_MOUNTAIN_LION_INSTALLER)
	mkdir -p dmg
	sudo prepare_iso/prepare_iso.sh $(MAC_OSX_10_8_MOUNTAIN_LION_INSTALLER) dmg

dmg/$(MAC_OSX_10_9_MAVERICKS_BOOT_DMG): $(MAC_OSX_10_9_MAVERICKS_INSTALLER)
	mkdir -p dmg
	sudo prepare_iso/prepare_iso.sh $(MAC_OSX_10_9_MAVERICKS_INSTALLER) dmg

$(VMWARE_BOX_DIR)/osx109$(BOX_SUFFIX): osx109.json $(SOURCES) dmg/$(MAC_OSX_10_9_MAVERICKS_BOOT_DMG)
	rm -rf $(VMWARE_OUTPUT)
	mkdir -p $(VMWARE_BOX_DIR)
	packer build -only=$(VMWARE_BUILDER) $(PACKER_VARS) -var "iso_url=dmg/$(MAC_OSX_10_9_MAVERICKS_BOOT_DMG)" $<

$(VMWARE_BOX_DIR)/osx109-desktop$(BOX_SUFFIX): osx109-desktop.json $(SOURCES) tpl/vagrantfile-osx109-desktop.tpl
	rm -rf $(VMWARE_OUTPUT)
	mkdir -p $(VMWARE_BOX_DIR)
	packer build -only=$(VMWARE_BUILDER) $(PACKER_VARS) -var "iso_url=dmg/$(MAC_OSX_10_9_MAVERICKS_BOOT_DMG)" $<

$(VMWARE_BOX_DIR)/osx108$(BOX_SUFFIX): osx108.json $(SOURCES)
	rm -rf $(VMWARE_OUTPUT)
	mkdir -p $(VMWARE_BOX_DIR)
	packer build -only=$(VMWARE_BUILDER) $(PACKER_VARS) -var "iso_url=dmg/$(MAC_OSX_10_8_MOUNTAIN_LION_BOOT_DMG)" $<

$(VMWARE_BOX_DIR)/osx108-desktop$(BOX_SUFFIX): osx108-desktop.json $(SOURCES) tpl/vagrantfile-osx108-desktop.tpl
	rm -rf $(VMWARE_OUTPUT)
	mkdir -p $(VMWARE_BOX_DIR)
	packer build -only=$(VMWARE_BUILDER) $(PACKER_VARS) -var "iso_url=dmg/$(MAC_OSX_10_8_MOUNTAIN_LION_BOOT_DMG)" $<

$(VMWARE_BOX_DIR)/osx107$(BOX_SUFFIX): osx107.json $(SOURCES)
	rm -rf $(VMWARE_OUTPUT)
	mkdir -p $(VMWARE_BOX_DIR)
	packer build -only=$(VMWARE_BUILDER) $(PACKER_VARS) -var "iso_url=dmg/$(MAC_OSX_10_7_LION_BOOT_DMG)" $<

$(VMWARE_BOX_DIR)/osx107-desktop$(BOX_SUFFIX): osx107-desktop.json $(SOURCES) tpl/vagrantfile-osx107-desktop.tpl
	rm -rf $(VMWARE_OUTPUT)
	mkdir -p $(VMWARE_BOX_DIR)
	packer build -only=$(VMWARE_BUILDER) $(PACKER_VARS) -var "iso_url=dmg/$(MAC_OSX_10_7_LION_BOOT_DMG)" $<

list:
	@for shortcut_target in $(SHORTCUT_TARGETS) ; do \
		echo $$shortcut_target ; \
	done

validate:
	@for template_filename in $(TEMPLATE_FILENAMES) ; do \
		echo Checking $$template_filename ; \
		packer validate $$template_filename ; \
	done

clean: clean-builders clean-output clean-packer-cache

clean-builders:
	@for builder in $(BUILDER_TYPES) ; do \
		if test -d box/$$builder ; then \
			echo Deleting box/$$builder/*.box ; \
			find box/$$builder -maxdepth 1 -type f -name "*.box" ! -name .gitignore -exec rm '{}' \; ; \
		fi ; \
	done

clean-output:
	@for builder in $(BUILDER_TYPES) ; do \
		echo Deleting output-$$builder-iso ; \
		echo rm -rf output-$$builder-iso ; \
	done

clean-packer-cache:
	echo Deleting packer_cache
	rm -rf packer_cache

test-$(VMWARE_BOX_DIR)/%$(BOX_SUFFIX): $(VMWARE_BOX_DIR)/%$(BOX_SUFFIX)
	bin/test-box.sh $< vmware_desktop vmware_fusion $(CURRENT_DIR)/test/*_spec.rb

ssh-$(VMWARE_BOX_DIR)/%$(BOX_SUFFIX): $(VMWARE_BOX_DIR)/%$(BOX_SUFFIX)
	bin/ssh-box.sh $< vmware_desktop vmware_fusion $(CURRENT_DIR)/test/*_spec.rb
