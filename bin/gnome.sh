#!/usr/bin/env bash

# Script to set my prefered keybinds and other settings on Gnome
#     Rombertus

# ----------------------------------------------------------------
# config
# ----------------------------------------------------------------

CUSTOM="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:\
/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

# Custom commands tuple
NAMES=("Terminal")
COMMANDS=("gnome-terminal")
BINDINGS=("<Super>t")

# ----------------------------------------------------------------
# commands
# ----------------------------------------------------------------

# Set dark mode and background
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.background picture-uri-dark "file://$(pwd)/files/forest-2-wp.jpg" 

# Enable fractional scaling for wayland gnome
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Setup touchpad
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# Unbind launching applications
for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]";done

# Set to 6 fixed workspaces and keybinds for workspace switching
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 6
for i in {1..6}; do gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']" ; done
for i in {1..6}; do gsettings set "org.gnome.desktop.wm.keybindings" "move-to-workspace-$i" "['<Super><Shift>$i']" ; done

# Set custom keybinds
gsettings set org.gnome.desktop.wm.keybindings close "['<Super><Shift>q']"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['$KEY_PATH/custom0/']"

for i in "${!NAMES[@]}"; do
    KEYBINDING_PATH="$CUSTOM/custom$i/"
    gsettings set "$KEYBINDING_PATH" name "${NAMES[i]}"
    gsettings set "$KEYBINDING_PATH" command "${COMMANDS[i]}"
    gsettings set "$KEYBINDING_PATH" binding "${BINDINGS[i]}"	
done
