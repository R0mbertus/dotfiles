#!/usr/bin/env bash

# Install script to select and install the chosen items using a whiptail tui
#     Rombertus

# ----------------------------------------------------------------
# config
# ----------------------------------------------------------------

# Set a nice dark theme for whiptail
# https://gist.github.com/ymkins/bb0885326f3e38850bc444d89291987a
export NEWT_COLORS="
    root=green,black
    border=green,black
    title=green,black
    roottext=white,black
    window=green,black
    textbox=white,black
    button=black,green
    compactbutton=white,black
    listbox=white,black
    actlistbox=black,white
    actsellistbox=black,green
    checkbox=green,black
    actcheckbox=black,green
"

# ----------------------------------------------------------------
# commands
# ----------------------------------------------------------------

# Install whiptail if not yet installed
if ! command -v whiptail > /dev/null; then
    echo "whiptail not found. Installing whiptail..."
    sudo dnf install -yq newt
fi

CHECKLIST=$(whiptail  --separate-output --title "Installation Options" \
    --checklist "Choose options to install:" 20 80 4 \
    1 "Setup Fedora" OFF \
    2 "Setup Gnome" OFF \
    3 "Setup zsh" OFF \
    3>&1 1>&2 2>&3)

for CHOICE in $CHECKLIST; do
    case $CHOICE in
        1)
            bash bin/fedora.sh
            ;;
        2)
            bash bin/gnome.sh
            ;;
        3)
            bash bin/zsh.sh
            ;;
        *)
            echo "Unsupported item $CHOICE!" >&2
            exit 1
            ;;
    esac
done
