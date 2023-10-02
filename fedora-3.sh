#!/bin/sh

# A simple script to do some post install of fedora (part 2)
# This will setup distrobox with a 'ctf' kali linux container
#     Rombertus

# installs podman for distrobox
sudo dnf install podman

# install distrobox
sudo dnf copr enable alciregi/distrobox
sudo dnf install distrobox

distrobox-create --name ctf --image kali-latest-stable:latest
