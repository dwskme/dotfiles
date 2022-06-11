#!/bin/bash

path="$HOME/myrepo/i3/themes"
ptheme="$HOME/myrepo/polybar/themes"
mod="$HOME/myrepo/polybar/themes/modules"

declare -a options=(
"doom-one"
"dracula"
"catppuccin"
"gruvbox"
"gruvbox-powerline"
"monokai-pro"
"nord"
"ocean"
"tomorrow-night"
"onedark"
"papercolor"
"onedark"
"tokyonight"
"moonfly"
"sonokai"
"quit"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 20 -p 'Themes')

case $choice in
    'doom-one')
       cp $path/doom-one.conf $path/theme.conf && cp $ptheme/doom-one.ini $ptheme/theme.ini && cp $mod/doom-one.ini $mod/modules.ini && i3-msg restart ;;
    'dracula')
       cp $path/dracula.conf $path/theme.conf && cp $ptheme/dracula.ini $ptheme/theme.ini && cp $mod/dracula.ini $mod/modules.ini && i3-msg restart ;;
    'gruvbox')
       cp $path/gruvbox.conf $path/theme.conf && cp $ptheme/gruvbox.ini $ptheme/theme.ini && cp $mod/gruvbox.ini $mod/modules.ini && i3-msg restart ;;
    'gruvbox-powerline')
       cp $path/gruvbox.conf $path/theme.conf && cp $ptheme/gruvbox.ini $ptheme/theme.ini && cp $mod/gruvbox_powerline.ini $mod/modules.ini && i3-msg restart ;;
    'monokai-pro')
       cp $path/monokai-pro.conf $path/theme.conf && cp $ptheme/monokai-pro.ini $ptheme/theme.ini && cp $mod/monokai-pro.ini $mod/modules.ini && i3-msg restart ;;
    'nord')
       cp $path/nord.conf $path/theme.conf && cp $ptheme/nord.ini $ptheme/theme.ini && cp $mod/nord.ini $mod/modules.ini && i3-msg restart ;;
    'ocean')
       cp $path/ocean.conf $path/theme.conf && cp $ptheme/ocean.ini $ptheme/theme.ini && cp $mod/ocean.ini $mod/modules.ini && i3-msg restart ;;
    'tomorrow-night')
       cp $path/tomorrow-night.conf $path/theme.conf && cp $ptheme/tomorrow-night.ini $ptheme/theme.ini && cp $mod/tomorrow-night.ini $mod/modules.ini && i3-msg restart ;;
    'papercolor')
       cp $path/papercolor.conf $path/theme.conf && cp $ptheme/papercolor.ini $ptheme/theme.ini && cp $mod/papercolor.ini $mod/modules.ini && i3-msg restart ;;
    'tokyonight')
       cp $path/tokyonight.conf $path/theme.conf && cp $ptheme/tokyonight.ini $ptheme/theme.ini && cp $mod/tokyonight.ini $mod/modules.ini && i3-msg restart ;;
    'onedark')
       cp $path/onedark.conf $path/theme.conf && cp $ptheme/onedark.ini $ptheme/theme.ini && cp $mod/onedark.ini $mod/modules.ini && i3-msg restart ;;
    'moonfly')
       cp $path/moonfly.conf $path/theme.conf && cp $ptheme/moonfly.ini $ptheme/theme.ini && cp $mod/moonfly.ini $mod/modules.ini && i3-msg restart ;;
    'sonokai')
       cp $path/sonokai.conf $path/theme.conf && cp $ptheme/sonokai.ini $ptheme/theme.ini && cp $mod/sonokai.ini $mod/modules.ini && i3-msg restart ;;
    'catppuccin')
       cp $path/catppuccin.conf $path/theme.conf && cp $ptheme/catppuccin.ini $ptheme/theme.ini && cp $mod/catppuccin.ini $mod/modules.ini && i3-msg restart ;;

    'quit')
        echo "No theme chosen" && exit 1 ;;
esac
