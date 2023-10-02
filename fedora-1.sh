#!/bin/bash

# A simple script to do some post install of fedora (part 1)
#     Rombertus

# add some options to dnf to speed it up
echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

# run my gnome binds script
sh gnome-bindings.sh

# install zsh and oh-my-zsh
sudo dnf install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
