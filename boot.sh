#!/bin/bash

ansi_art='                 ▄▄▄                                                   
 ▄█████▄    ▄███████████▄    ▄███████   ▄███████   ▄███████   ▄█   █▄    ▄█   █▄ 
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   █▀   ███   ███  ███   ███
███   ███  ███   ███   ███ ▄███▄▄▄███ ▄███▄▄▄██▀  ███       ▄███▄▄▄███▄ ███▄▄▄███
███   ███  ███   ███   ███ ▀███▀▀▀███ ▀███▀▀▀▀    ███      ▀▀███▀▀▀███  ▀▀▀▀▀▀███
███   ███  ███   ███   ███  ███   ███ ██████████  ███   █▄   ███   ███  ▄██   ███
███   ███  ███   ███   ███  ███   ███  ███   ███  ███   ███  ███   ███  ███   ███
 ▀█████▀    ▀█   ███   █▀   ███   █▀   ███   ███  ███████▀   ███   █▀    ▀█████▀ 
                                       ███   █▀                                  '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/omarchy
OMARCHY_REPO="${OMARCHY_REPO:-fmproj/fm_omarchy}"

echo -e "\nCloning Omarchy from: https://github.com/${OMARCHY_REPO}.git"
rm -rf ~/.local/share/omarchy/
git clone "https://github.com/${OMARCHY_REPO}.git" ~/.local/share/omarchy >/dev/null

echo -e "\nInstallation starting..."
source ~/.local/share/omarchy/install.sh
