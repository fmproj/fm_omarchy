#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

OMARCHY_INSTALL=~/.local/share/omarchy/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mOmarchy installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/omarchy/install.sh"
}

trap catch_errors ERR

# Install prerequisites
source $OMARCHY_INSTALL/preflight/aur.sh
# source $OMARCHY_INSTALL/preflight/migrations.sh

# Configuration
echo "Let's install Omarchy! [1/5]"
source $OMARCHY_INSTALL/config/identification.sh
source $OMARCHY_INSTALL/config/config.sh
source $OMARCHY_INSTALL/config/detect-keyboard-layout.sh
source $OMARCHY_INSTALL/config/network.sh
source $OMARCHY_INSTALL/config/power.sh
source $OMARCHY_INSTALL/config/timezones.sh
source $OMARCHY_INSTALL/config/login.sh
source $OMARCHY_INSTALL/config/nvidia.sh

# Development
echo "Installing terminal tools [2/5]"
source $OMARCHY_INSTALL/development/terminal.sh
source $OMARCHY_INSTALL/development/development.sh
source $OMARCHY_INSTALL/development/nvim.sh
source $OMARCHY_INSTALL/development/docker.sh
source $OMARCHY_INSTALL/development/firewall.sh

# Desktop
echo "Installing desktop tools [3/5]"
source $OMARCHY_INSTALL/desktop/desktop.sh
source $OMARCHY_INSTALL/desktop/hyprlandia.sh
source $OMARCHY_INSTALL/desktop/theme.sh
source $OMARCHY_INSTALL/desktop/bluetooth.sh
source $OMARCHY_INSTALL/desktop/fonts.sh
source $OMARCHY_INSTALL/desktop/printer.sh

# Apps
echo "Installing default applications [4/5]"
source $OMARCHY_INSTALL/apps/xtras.sh
source $OMARCHY_INSTALL/apps/mimetypes.sh

# Updates
echo "Updating system packages [5/5]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
gum confirm "Reboot to apply all settings?" && reboot
