#!/bin/bash

# A simple script to do some post install of fedora (part 1)
#     Rombertus

# add some options to dnf to speed it up
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# run my gnome binds script
sh gnome-bindings.sh

# enable flathub apps and install flatseal
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install -y flatseal

# install tweaks and the extensions app 
sudo dnf install -y gnome-extensions-app gnome-tweaks
sudo dnf install -y gnome-shell-extension-appindicator
sudo dnf install -y gnome-shell-extension-pop-shell

# install zsh and oh-my-zsh
sudo dnf install zsh
cp .zshrc $HOME/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
