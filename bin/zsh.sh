#!/usr/bin/env bash

# Install script to select and install the chosen items using a whiptail tui
#     Rombertus

# ----------------------------------------------------------------
# commands
# ----------------------------------------------------------------

if [ -x "$(command -v apk)" ]; then 
    sudo apk add --no-cache zsh
elif [ -x "$(command -v apt-get)" ]; then 
    sudo apt-get install zsh
elif [ -x "$(command -v dnf)" ]; then 
    sudo dnf install zsh
elif [ -x "$(command -v zypper)" ]; then 
    sudo zypper install zsh
else 
    echo "Package manager not found, install: zsh" >&2
    exit 1
fi

cp $(pwd)/files/.zshrc $HOME/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/\
tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
