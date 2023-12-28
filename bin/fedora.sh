#!/usr/bin/env bash

# Script to do some post install on fedora
#     Rombertus

# ----------------------------------------------------------------
# config
# ----------------------------------------------------------------

APPS="gnome-extensions-app gnome-tweaks gnome-shell-extension-appindicator \
gnome-shell-extension-pop-shell podman" 

# ----------------------------------------------------------------
# commands
# ----------------------------------------------------------------

# Tweak dnf flags
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# Install updates
sudo dnf -q upgrade --refresh
sudo dnf -q check
sudo dnf -q autoremove

# Install apps
sudo dnf install -q https://mirrors.rpmfusion.org/free/fedora/rpmfusion-\
    free-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf install -q https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-\
    nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr -q enable alciregi/distrobox
sudo dnf -q install -yq $APPS

# Install distrobox
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | \
    sudo sh

# Enable flathub apps and install flatseal
flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install -y flatseal
