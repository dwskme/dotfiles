#!/bin/bash

################################################### 
##      _                 _                      ##
##     | |               | |                     ##
##   __| |__      __ ___ | | __ _ __ ___    ___  ##
##  / _` |\ \ /\ / // __|| |/ /| '_ ` _ \  / _ \ ##
## | (_| | \ V  V / \__ \|   < | | | | | ||  __/ ##
##  \__,_|  \_/\_/  |___/|_|\_\|_| |_| |_| \___| ##
##                                               ##
###################################################                                              

# Update
sudo pacman -Syyu --noconfirm || exit 1

# Install all packages
sudo pacman -S --noconfirm $(sed '1d' pack.csv | awk -F "," '{print $1}' | xargs) || exit 1

# set touchpad
sudo cp -v -r etc /

# copy all configs
cp -v -r ../.config ~/.config
cp -v -r ../.dots/{.bashrc,.zshrc,.xinitrc,.xprofile} ~/
echo 'export EDITOR="nvim"' >> ~/.bashrc


# copy wallpapers
mkdir -v -p ~/Wallpapers
cp -v -r ../wallpapers ~/Wallpapers

