#!/bin/zsh

# =============================================================================
# Enhanced macOS Development Environment Installer
# Author: dwskme
# Description: Automated setup script for macOS development environment
# Last Updated: 2024
# =============================================================================


# Color codes for pretty output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
print_step() {
    echo "\n${BLUE}==>${NC} ${GREEN}$1${NC}"
}

print_warning() {
    echo "${YELLOW}WARNING:${NC} $1"
}

print_error() {
    echo "${RED}ERROR:${NC} $1"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
    print_error "Please don't run as root/sudo"
    exit 1
fi

# Create necessary directories
print_step "Creating necessary directories..."
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.cache"

# =============================================================================
# System Setup
# =============================================================================

print_step "Installing xCode command-line tools..."
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
else
    print_warning "xCode command-line tools already installed"
fi

print_step "Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    print_warning "Homebrew already installed"
fi

brew analytics off

# =============================================================================
# Core Development Tools
# =============================================================================

print_step "Installing essential development tools..."
brew install \
    git neovim wget jq ripgrep mas gh ifstat \
    bat grep fzf commitizen fd ack fastfetch \
    openjdk coreutils ed findutils gawk gnu-sed \
    gnu-tar make aria2 xz cairo eza hyperfine \
    most ranger httpie

# Optional tools (commented as in original)
# brew install switchaudio-osx
# brew install gobject-introspection
# brew install pyenv
# brew install micromamba

# Optional terminal emulators (commented as in original)
# brew install --cask alacritty
# brew install --cask kitty

# Optional development tools (commented as in original)
# brew install --cask machoview
# brew install --cask hex-fiend
# brew install --cask cutter
# brew install --cask sloth sketchybar

# Optional tools (uncomment if needed)
# brew install gobject-introspection
# brew install pyenv
# brew install micromamba
# brew install switchaudio-osx

# Optional terminal emulators (uncomment if needed)
# brew install --cask alacritty
# brew install --cask kitty

# Optional development tools (uncomment if needed)
# brew install --cask machoview  # Binary file viewer
# brew install --cask hex-fiend  # Hex editor
# brew install --cask cutter     # Reverse engineering tool
# brew install --cask sloth      # Process monitor

# =============================================================================
# Shell Environment
# =============================================================================

print_step "Installing shell environments and tools..."
brew install fish nushell starship zoxide

# Shell customization
print_step "Setting up Oh My ZSH and plugins..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    # Install ZSH plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoupdate
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# =============================================================================
# Programming Languages & Package Managers
# =============================================================================

print_step "Installing programming languages and package managers..."

# Node.js setup
brew install nvm
mkdir -p "$HOME/.nvm"

# Add NVM initialization to profile
cat << 'EOF' >> "$HOME/.zshrc"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
EOF
source "$HOME/.zshrc"
nvm install --lts

# Other languages and package managers
brew install oven-sh/bun/bun pnpm lua luarocks rust go

# =============================================================================
# Python Environment Setup
# =============================================================================

print_step "Setting up Python environment..."
brew install --cask miniforge
conda init "$(basename "${SHELL}")"
# brew install micromamba
brew install uv   


# =============================================================================
# Development Tools & Applications
# =============================================================================

print_step "Installing development applications..."

brew install --cask \
    visual-studio-code iterm2 docker \
    tableplus wireshark httpie obs \
    zed vlc keycastr imageoptim 


brew install \
    lazygit dooit btop \ # Terminal UI tools
    texlab mactex \ # LaTeX tools
    wireguard-go svim # Network and clipboard tools

# Network Tools
brew install wireguard-go

# AI Development
brew install ollama
# Setup Ollama Web UI with exact original parameters
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

# System Settings
defaults write -g com.apple.trackpad.scaling 3
defaults write -g com.apple.mouse.scaling 3
defaults write com.apple.AdLib personalizedAds -bool false

# =============================================================================
# Productivity Applications
# =============================================================================

print_step "Installing productivity applications..."
brew install --cask \
    raycast obsidian bitwarden slack \
    whatsapp discord spotify zoom \
    meetingbar skim appcleaner onyx \
    microsoft-office inkscape iina \
    lulu orion google-chrome 

# Install Spicetify (Spotify customization)
brew install spicetify-cli

# Install Mac App Store Applications
print_step "Installing Mac App Store applications..."
mas install 1451685025  # WireGuard VPN Client
mas install 497799835   # Xcode
mas install 1480933944  # Vimari (Safari extension)
mas install 682658836   # GarageBand
mas install 1496833156  # Swift Playgrounds

# Window Management
brew install sketchybar borders koekeishiya/formulae/skhd
skhd --start-service     # Start the skhd service for shortcut management
brew services start sketchybar
brew services start borders

# =============================================================================
# Security Tools
# =============================================================================

print_step "Setting up security tools..."
brew install --cask secretive
brew install gpg pinentry-mac gnupg

# Git configuration
print_step "Configuring Git..."
git config --global user.name "dwskme"
git config --global user.email "officialsamirkc@gmail.com"
git config --global init.defaultBranch main
git config --global core.editor nvim
git config --global color.ui auto
git config --global pull.rebase false

# Additional Git configurations
git config --global core.autocrlf input          # Line endings management
git config --global core.whitespace fix,-indent-with-non-tab,trailing-space,cr-at-eol  # Whitespace handling
git config --global diff.colorMoved default      # Better diff coloring
git config --global merge.conflictstyle diff3    # Better merge conflict display
git config --global rebase.autosquash true      # Auto-squash fixup commits
git config --global help.autocorrect 1          # Auto-correct Git commands
git config --global fetch.prune true            # Auto-prune when fetching
git config --global push.default current        # Push to current branch by default
git config --global pull.ff only                # Only allow fast-forward pulls
git config --global commit.gpgsign true         # Sign commits with GPG
git config --global tag.gpgsign true            # Sign tags with GPG
git config --global core.pager 'delta'          # Use delta for better diffs
git config --global interactive.diffFilter 'delta --color-only'

# =============================================================================
# Fonts
# =============================================================================

print_step "Installing fonts..."
brew tap homebrew/cask-fonts
brew install --cask \
    sf-symbols font-hack-nerd-font \
    font-jetbrains-mono font-fira-code \
    font-iosevka-term-nerd-font

# =============================================================================
# System Configurations
# =============================================================================

#!/bin/bash

echo "Configuring macOS system preferences..."

# General UI/UX & iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false        # Prevent saving to iCloud by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true        # Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true       # Expand save panel by default (all apps)
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true           # Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true          # Expand print panel by default (all apps)
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false        # Save to disk by default, not iCloud
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"                   # Enable Dark Mode
defaults write NSGlobalDomain AppleAccentColor -int 1                              # Set accent color
defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431" # Set highlight color
defaults write NSGlobalDomain _HIHideMenuBar -bool true                            # Auto-hide menu bar
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false        # Disable window animations
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001                      # Speed up window resize animations
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"                 # Always show scrollbars
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2                    # Set sidebar icon size to medium
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false                  # Disable focus ring animation

# Keyboard & Input
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3                         # Enable full keyboard access for all controls
defaults write NSGlobalDomain InitialKeyRepeat -int 15                            # Initial key repeat
defaults write NSGlobalDomain KeyRepeat -int 1                                    # Key repeat rate
defaults write NSGlobalDomain AppleFontSmoothing -int 0                          # Disable font smoothing
defaults write NSGlobalDomain AppleShowAllExtensions -bool true                   # Show all file extensions
defaults write -g ApplePressAndHoldEnabled -bool false                           # Enable key repetition
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false    # Disable auto-correct
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false        # Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false    # Disable period substitution
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false      # Disable dash substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false     # Disable quote substitution

# Finder
defaults write com.apple.finder NewWindowTarget -string "PfHm"                   # New window points to home directory
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"     # Set new window target path
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true         # Open window for new removable disk
defaults write com.apple.finder ShowPathbar -bool true                            # Show path bar
defaults write com.apple.finder ShowStatusBar -bool true                          # Show status bar
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"               # List view by default
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true               # Show full POSIX path in title
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false        # Disable extension change warning
defaults write com.apple.finder QLEnableTextSelection -bool true                  # Enable text selection in Quick Look
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false       # Hide external drives
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false              # Hide internal drives
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false          # Hide removable media
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false          # Hide mounted servers
defaults write com.apple.finder DisableAllAnimations -bool true                  # Disable animations
defaults write com.apple.Finder AppleShowAllFiles -bool true                     # Show hidden files
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"              # Search current folder by default
defaults write com.apple.finder FXRemoveOldTrashItems -bool true                 # Auto-empty trash after 30 days
defaults write com.apple.finder WarnOnEmptyTrash -bool false                     # Disable warning before emptying trash
defaults write com.apple.finder QLImageSize -int 1                               # Enable image preview
defaults write com.apple.finder QLTextSize -int 1                                # Enable text preview
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true    # Avoid .DS_Store on network volumes

# Dock & Mission Control
defaults write com.apple.dock expose-group-by-app -bool false                    # Don't group windows by application in Mission Control
defaults write com.apple.dock autohide -bool true                                # Auto-hide dock
defaults write com.apple.dock autohide-delay -float 0                           # Remove auto-hide delay
defaults write com.apple.dock autohide-time-modifier -float 0.15                # Set hide/show animation time (faster)
defaults write com.apple.dock show-recents -bool false                          # Hide recent applications
defaults write com.apple.dock minimize-to-application -bool true                # Minimize windows into application icon
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true # Enable spring loading
defaults write com.apple.dock size-keep -bool true                              # Keep dock size fixed
defaults write com.apple.dock show-process-indicators -bool true                # Show indicators for open applications
defaults write com.apple.dock mouse-over-hilite-stack -bool true               # Enable stack hover effect
defaults write com.apple.dock mineffect -string "scale"                        # Set minimize effect to scale
defaults write com.apple.dock "mru-spaces" -bool false                         # Disable automatic space rearrangement
defaults write com.apple.dock expose-animation-duration -float 0.1              # Speed up Mission Control animations

# Security & Privacy
defaults write com.apple.LaunchServices LSQuarantine -bool false                # Disable quarantine warnings
defaults write com.apple.AdLib personalizedAds -bool false                      # Disable personalized ads
defaults write com.apple.assistant.support "Assistant Enabled" -bool false      # Disable Siri
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool false  # Disable guest access

# Screenshots
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots" # Set screenshot location
defaults write com.apple.screencapture type -string "png"                          # Set format to PNG
defaults write com.apple.screencapture disable-shadow -bool true                   # Disable window shadow

# Trackpad & Mouse
defaults write com.apple.universalaccess scrollwheel.scaling 3  # Set Scroll speed to max
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3.0               # Max trackpad speed
defaults write NSGlobalDomain com.apple.mouse.scaling -float 3.0                  # Max mouse speed
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true             # Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true # Enable tap to click (Bluetooth)
defaults write com.apple.trackpad.lookupEnabled -bool false                      # Disable look up gesture
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false         # Disable natural scroll
defaults write -g NSWindowShouldDragOnGesture YES                                # Enable window dragging with trackpad gesture

# Hot Corners & Mission Control
defaults write com.apple.dock wvous-tl-corner -int 0                             # Disable top left corner
defaults write com.apple.dock wvous-tr-corner -int 0                             # Disable top right corner
defaults write com.apple.dock wvous-bl-corner -int 0                             # Disable bottom left corner
defaults write com.apple.dock wvous-br-corner -int 0                             # Disable bottom right corner
defaults write com.apple.dock showAppExposeGestureEnabled -bool false            # Disable App Exposé gesture
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 '{enabled = 0;}' # Disable Mission Control
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 44 '{enabled = 0;}' # Disable Show Desktop
defaults write com.apple.spaces spans-displays -bool false                       # Disable spaces spanning displays

# Safari Development
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false                # Disable auto-open downloads
defaults write com.apple.Safari IncludeDevelopMenu -bool true                    # Show Develop menu
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true # Enable WebKit Developer Extras
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true                   # Enable WebKit Developer Extras globally

# Development
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true          # Show build time in Xcode

# Mail & Preview
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false       # Copy email addresses without names
defaults write com.apple.Preview ApplePersistenceIgnoreState YES                 # Don't reopen previous files

# Sound & Photos
defaults write com.apple.sound.beep.feedback -bool false                        # Disable sound feedback
defaults write com.apple.Photos IPXDefaultNegativeKeyword "delete"              # Set default negative keyword
defaults write com.apple.Photos IPXDefaultPositiveKeyword "favorite"            # Set default positive keyword

# Applications
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true               # Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0                     # Show all processes

# System
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1                    # Show all network interfaces
defaults write com.apple.menuextra.battery ShowPercent -string "YES"             # Show battery percentage
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES      # Don't offer new disks for backup
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true    # Quit printer app when finished
sudo defaults write /Library/Preferences/com.apple.CoreGraphics "CGTaskDisplayNightShiftMode" -int 1 # Enable Night Shift

# System Identity (requires sudo)
sudo scutil --set ComputerName "devmachine"
sudo scutil --set LocalHostName "dwskme"
sudo scutil --set HostName "sam"

# Show Library folder in Finder
chflags nohidden ~/Library

echo "Configuration complete. Note: Some changes require a logout/restart to take effect."# =============================================================================
# Environment Setup
# =============================================================================

print_step "Setting up environment configuration..."

# Create .profile if it doesn't exist
PROFILE_FILE="$HOME/.profile"
touch "$PROFILE_FILE"

# Add environment configurations
cat << 'EOF' > "$PROFILE_FILE"
# Environment Configuration

# Path Configuration
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Programming Languages
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$JAVA_HOME/bin:$PATH"

export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# Ruby Configuration
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Python Configuration
export PYTHONPATH="$HOME/.local/lib/python3.9/site-packages:$PYTHONPATH"
export PYTHONDONTWRITEBYTECODE=1

# Node.js Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# GNU Utils Path
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

# Editor Configuration
export EDITOR='nvim'
export VISUAL='code'
export PAGER='less'
export LESS='-R'

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Application-specific configurations
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
export npm_config_prefix="$HOME/.local"

# Locale settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

EOF

# Source profile in shell configs
echo "source $PROFILE_FILE" >> "$HOME/.zshrc"
[ -f "$HOME/.config/fish/config.fish" ] && echo "source $PROFILE_FILE" >> "$HOME/.config/fish/config.fish"

# =============================================================================
# Final Setup
# =============================================================================

print_step "Performing final setup tasks..."

# Create Screenshots directory
mkdir -p "$HOME/Pictures/Screenshots"

# Setup Python Data Science Environment
print_step "Setting up Python data science packages..."
conda install -y numpy pandas matplotlib seaborn scikit-learn

# Clone and Setup Dotfiles
print_step "Setting up dotfiles..."
if [ ! -d "$HOME/dotfiles" ]; then
    git clone --bare git@github.com:FelixKratz/dotfiles.git $HOME/dotfiles
    git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout master
fi

# Install Additional Fonts
print_step "Installing additional fonts..."
if [ ! -f "$HOME/Library/Fonts/sketchybar-app-font.ttf" ]; then
    git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
    mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
    rm -rf /tmp/SFMono_Nerd_Font/
    
    curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf \
        -o $HOME/Library/Fonts/sketchybar-app-font.ttf
fi


# Set computer name
sudo scutil --set ComputerName "devmachine"
sudo scutil --set LocalHostName "dwskme"
sudo scutil --set HostName "sam"

# Disable SMB guest access
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool false

# Start services
print_step "Starting services..."
brew services start skhd
brew services start yabai
brew services start svim

print_step "Installation complete!"
echo "Please restart your computer to ensure all changes take effect."

# Final status check
csrutil status
echo "NOTE: Don't forget to:"
echo "1. Disable SIP for yabai"
echo "2. Configure keyboard settings"
echo "3. Add necessary sudo permissions for yabai"
echo "4. Set up GPG keys if needed"
echo "5. Configure any remaining application-specific settings"
echo "6. Setup HomeRowMod"
