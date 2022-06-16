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

#Install paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru

#Installing node and npm
paru -S nvm 
# echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
exec $SHELL
nvm install --lts
nvm use --lts


# Install all packages
sudo pacman -S --noconfirm $(sed '1d' pack.csv | awk -F "," '{print $1}' | xargs) || exit 1

# enable TLP
sudo systemctl enable tlp

# set touchpad
sudo cp -v -r etc /

# copy all configs
cp -v -r .config ~/.config
cp -v -r dots/{.bash_profile,.xinitrc,.xprofile,.scripts} ~/
echo 'export EDITOR="nvim"' >> ~/.bashrc
echo 'set -o vi' >> ~/.bashrc


# copy wallpapers
mkdir -v -p ~/Wallpapers
cp -v -r walls ~/Images/Wallpapers

