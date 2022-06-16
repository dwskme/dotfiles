

#Installing miniconda
paru -S miniconda


#5.Set the location and make the required sh executable

#6.Install and setup wm, bar, fonts, ssdm, rofi, compositer
paru -R i3-wm
paru -S rofi ssdm i3-gaps  

#7.Install and setup drivers: Bluetooth, wifi, xorg-backlight, ntfs-3g, etc
paru -S bluetooth-applet xorg-backlight ntfs-3g os-prober grub-customizer tlp tlpui auto-cpufreq


#8.Install and setup software in .config: browser, filemanager,
paru -S firefox google-chrome opera telegram slack figma-linux vlc ffmpeg discord


#9.Install ans config programming tools:
paru -S postman visual-studio-code-bin fish 


#10. Install and config eyecandies and tui:
paru -S alacritty w3m nvm tmux xclip screenkey task vim neovim python-pywal


#11. Installing Rust Applications
sudo pacman -S exa bat fd dust ripgrep tokei zoxide fzf -y


#Installing Terminal based apps
paru -S aria2 ranger spotify-tui ncmpcpp


#Installing Eyecandies
paru -S neofetch cointop htop bpytop speedtest-cli shell-color-scripts cbonsai
npm install -g mapscii





##keyring authtool  compositer notfication-daemon  nm-connection-editor meld  Xfce4-power-manager-settings"

