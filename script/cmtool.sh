#!/bin/bash -eux

# Set CM & CM_VERSION inside of Packer's template:
#
# Valid values for CM are:
#   'nocm'     -- build a box without a config management tool
#   'chef'     -- build a box with Chef 
#   'chefdk'   -- build a box with the Chef DK
#   'salt'     -- build a box with Salt
#   'puppet'   -- build a box with Puppet
#
# When $CM != 'nocm' valid options for
# $CM_VERSION are:
#   'x.y.z'    -- build a box with version x.y.z of Chef
#   'x.y.z'    -- build a box with version x.y.z of the Chef DK
#   'x.y'      -- build a box with version x.y Salt
#   'latest'   -- build a box with the latest version

install_chef()
{
    if [[ ${CM_VERSION} == 'latest' ]]; then
        echo "Installing latest Chef version"
        curl -Lk https://www.opscode.com/chef/install.sh | sh --
    else
        echo "Installing Chef version ${CM_VERSION}"
        curl -Lk https://www.opscode.com/chef/install.sh | sh -s -- -v $CM_VERSION
    fi
}

install_chefdk()
{
    echo "==> Installing Chef Development Kit"
    if [[ ${CM_VERSION} == 'latest' ]]; then
        echo "==> Installing latest Chef Development Kit version"
        curl -Lk https://www.opscode.com/chef/install.sh | sh -s -- -P chefdk
    else
        echo "==> Installing Chef Development Kit version ${CM_VERSION}"
        curl -Lk https://www.opscode.com/chef/install.sh | sh -s -- -P chefdk -v $CM_VERSION
    fi
    echo "==> Adding Chef Development Kit and Ruby to PATH"
    echo 'eval "$(chef shell-init bash)"' >> /Users/vagrant/.bash_profile
    chown vagrant /Users/vagrant/.bash_profile
}

install_salt() {
    echo "==> Installing Salt provisioner"
    if [[ ${CM_VERSION:-} == 'latest' ]]; then
        echo "==> Installing latest Salt version"
        curl -L http://bootstrap.saltstack.org | sudo sh
    else
        echo "==> Installing Salt version ${CM_VERSION}"
        curl -L http://bootstrap.saltstack.org | sudo sh -s -- git ${CM_VERSION}
    fi
}

# Install the latest Puppet and Facter using AutoPkg recipes
# https://github.com/autopkg/autopkg
#
# CM_VERSION, FACTER_VERSION and HIERA_VERSION can be overridden with specific versions,
# or "latest" to get the latest stable versions

CM_VERSION=${CM_VERSION:-latest}
FACTER_VERSION=${FACTER_VERSION:-latest}
HIERA_VERSION=${HIERA_VERSION:-latest}

# install function mostly borrowed dmg function from hashicorp/puppet-bootstrap,
# except we just take an already-downloaded dmg
function install_dmg() {
    local name="$1"
    local dmg_path="$2"

    echo "Installing: ${name}"

    # Mount the DMG
    echo "-- Mounting DMG..."
    tmpmount=$(/usr/bin/mktemp -d /tmp/puppet-dmg.XXXX)
    hdiutil attach "${dmg_path}" -mountpoint "${tmpmount}"

    echo "-- Installing pkg..."
    pkg_path=$(find "${tmpmount}" -name '*.pkg' -mindepth 1 -maxdepth 1)
    installer -pkg "${pkg_path}" -tgt /

    # Unmount
    echo "-- Unmounting and ejecting DMG..."
    hdiutil eject "${tmpmount}"
}

function get_dmg() {
    local recipe_name="$1"
    local version="$2"

    # Run AutoPkg setting VERSION, and saving the results as a plist
    "${AUTOPKG}" run --report-plist=/tmp/autopkg-puppet-report.plist ${recipe_name} -k VERSION="${version}" 1>&2
    echo $(/usr/libexec/PlistBuddy -c 'Print summary_results:url_downloader_summary_result:data_rows:0:download_path' /tmp/autopkg-puppet-report.plist)
}

install_puppet() {
    # Get AutoPkg
    AUTOPKG_DIR=$(mktemp -d /tmp/autopkg-XXXX)
    git clone https://github.com/autopkg/autopkg "$AUTOPKG_DIR"
    AUTOPKG="$AUTOPKG_DIR/Code/autopkg"

    # Add the recipes repo containing Puppet/Facter
    "${AUTOPKG}" repo-add recipes

    # Retrieve the installer DMGs
    PUPPET_DMG=$(get_dmg Puppet.download "${CM_VERSION}")
    FACTER_DMG=$(get_dmg Facter.download "${FACTER_VERSION}")
    HIERA_DMG=$(get_dmg Hiera.download "${HIERA_VERSION}")

    echo "Puppet DMG: $PUPPET_DMG"
    echo "Hiera  DMG: $HIERA_DMG"
    echo "Facter DMG: $FACTER_DMG"

    # Install them
    install_dmg "Puppet" "${PUPPET_DMG}"
    install_dmg "Facter" "${FACTER_DMG}"
    install_dmg "Hiera" "${HIERA_DMG}"

    # Hide all users from the loginwindow with uid below 500, which will include the puppet user
    defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES

    # Clean up
    rm -rf "${PUPPET_DMG}" "${FACTER_DMG}" "${HIERA_DMG}" "~/Library/AutoPkg"
}

#
# Main script
#
case "${CM}" in
  'chef')
    install_chef
    ;;

  'chefdk')
    install_chefdk
    ;;

  'salt')
    install_salt
    ;;

  'puppet')
    install_puppet
    ;;

  *)
    echo "Building box without baking in a configuration management tool"
    ;;
esac
