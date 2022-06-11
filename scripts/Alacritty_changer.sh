#!/bin/bash

config="$HOME/.config/alacritty/alacritty.yml"

declare -a options=(
"doom-one"
"dracula"
"catppuccin"
"gruvbox-dark"
"monokai-pro"
"nord"
"ocean"
"oceanic-next"
"solarized-light"
"solarized-dark"
"tomorrow-night"
"onedark"
"papercolor"
"onedark"
"tokyonight"
"moonfly"
"sonokai maia"
"quit"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Themes')

case $choice in
    'doom-one')
        sed -i '/colors:/c\colors: *doom-one' $config ;;
    'dracula')
        sed -i '/colors:/c\colors: *dracula' $config ;;
    'gruvbox-dark')
        sed -i '/colors:/c\colors: *gruvbox-dark' $config ;;
    'monokai-pro')
        sed -i '/colors:/c\colors: *monokai-pro' $config ;;
    'nord')
        sed -i '/colors:/c\colors: *nord' $config ;;
    'oceanic-next')
        sed -i '/colors:/c\colors: *oceanic-next' $config ;;
    'ocean')
        sed -i '/colors:/c\colors: *ocean' $config ;;
    'solarized-light')
        sed -i '/colors:/c\colors: *solarized-light' $config ;;
    'solarized-dark')
        sed -i '/colors:/c\colors: *solarized-dark' $config ;;
    'tomorrow-night')
        sed -i '/colors:/c\colors: *tomorrow-night' $config ;;
    'papercolor')
        sed -i '/colors:/c\colors: *papercolor' $config ;;
    'tokyonight')
        sed -i '/colors:/c\colors: *tokyonight' $config ;;
    'onedark')
        sed -i '/colors:/c\colors: *onedark' $config ;;
    'moonfly')
        sed -i '/colors:/c\colors: *moonfly' $config ;;
    'sonokai maia')
        sed -i '/colors:/c\colors: *sonokai' $config ;;
    'catppuccin')
        sed -i '/colors:/c\colors: *catppuccin' $config ;;

    'quit')
        echo "No theme chosen" && exit 1 ;;
esac
