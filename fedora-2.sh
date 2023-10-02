#!/bin/bash

# A simple script to do some post install of fedora (part 2)
#     Rombertus

# install tweaks and the extensions app 
sudo dnf install -y gnome-extensions-app gnome-tweaks
sudo dnf install -y gnome-shell-extension-appindicator

# enable flathub apps and install flatseal
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install -y flatseal

# install pop-shell
sudo dnf install -y gnome-shell-extension-pop-shell

# update
sudo dnf upgrade --refresh
sudo dnf check
sudo dnf autoremove
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
sudo reboot now
