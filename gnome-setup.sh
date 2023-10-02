#!/bin/bash

# A simple script to set my prefered keybinds and other settings on Gnome
#     Rombertus

# set dark mode and background
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.background picture-uri-dark "file://$(pwd)/forest-2-wp.jpg" 

# enable fractional scaling for wayland gnome
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# setup touchpad
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true


# unbind launching applications
for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]";done

# Sets to 6 fixed workspaces and keybinds for workspace switching
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
for i in {1..6}; do gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']" ; done
for i in {1..6}; do gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Super><Shift>$i']" ; done

# Sets close on press <super>+q
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"

# Sets some custom commands I use
# TODO: make adaptable to length
KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['$KEY_PATH/custom0/']"

names=("Terminal")
commands=("gnome-terminal")
bindings=("<Super>t")
CUSTOM="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

for i in "${!names[@]}"; do
    KEYBINDING_PATH="$CUSTOM/custom$i/"
    gsettings set "$KEYBINDING_PATH" name "${names[i]}"
    gsettings set "$KEYBINDING_PATH" command "${commands[i]}"
    gsettings set "$KEYBINDING_PATH" binding "${bindings[i]}"	
done
