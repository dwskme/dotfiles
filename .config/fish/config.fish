set fish_greeting  # Clear greeting

# Ensure fisherman and plugins are installed.
if status --is-interactive; and not test -f $HOME/.config/fish/functions/fisher.fish
  echo "==> Installing Fisherman..."
  curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end

set --export EDITOR nvim
set --export GIT_EDITOR nvim
set --export ERL_AFLAGS "-kernel shell_history enabled" # iex history


### aliaseviations (expanded aliases)
alias c 'code .'
alias ls 'exa -la  --icons'
alias combinepdfs 'pdfunite' # vertical
alias rg 'rg --follow' # Follow symbolic links (disable with --no-follow)
alias rgs 'rg --fixed-strings' # Exact match, no regex interpretation


#Git
alias g 'git'
alias gd 'git diff'
alias gds 'git diff --staged'
alias gc 'git commit'
alias gcm 'git commit --message'
alias gca 'git commit --all'
alias gcam 'git commit -am'
alias gcp 'git cherry-pick'
alias gl 'git log --oneline --decorate'
alias gg 'git log --graph --date=relative'
alias ggg 'git show --name-only'
alias ga 'git add'
alias gap 'git add --patch'
alias gu 'git add --update'
alias gan 'git add --intent-to-add'
alias gco 'git checkout'
alias gb 'git branch'
alias gp 'git push origin HEAD'
alias gpf 'git push origin HEAD --force-with-lease'
alias gpl 'git pull'
alias gsl 'git stash list'
alias gs 'git status --short --branch'
alias gsi 'git status --short --branch --ignored'
alias gsw 'git show'
alias space 'sudo ncdu --exclude-firmlinks /' # Interactive breakdown of disk space




### Aliases (shorthand functions)

alias ... 'cd ../..'
alias cman 'man 3' # Manual pages from the library section.
alias distro 'if test (uname) = "Linux"; cat /etc/os-release | head --lines=2; else; echo "Linux-only command"; end;'
alias ext extract
alias grep 'grep --color=auto'
alias ipconfig ifconfig
alias kernel 'uname -mrs'  # Shows the kernel version (e.g. Linux 3.2.0 x86_64)
alias less 'less -r' # Recognize escape sequences (e.g. read --help | less).
alias ls-size 'ls -horS'  # List directory contents sorted by increasing size.
alias md5 md5sum
alias mp 'mplayer -really-quiet -playlist'
alias nano 'nano --const'  # Constantly show the cursor position in nano.
alias public-ip 'curl icanhazip.com'
alias reconfig 'source ~/.config/fish/config.fish'
alias rgrep 'grep --recursive'
alias spaces2tabs "sed -i 's/ \+ /\t/g'"  # Replaces multiple spaces with a tab in the given file.
alias sshkey "copy ~/.ssh/id_rsa.pub; and echo 'Public key copied to clipboard'"
alias which 'which -a'  # Show all matches.
alias heic2jpg 'magick mogrify -monitor -format jpg *.HEIC' # Create JPGs from HEIC images in the current directory
alias date-utc 'date -u'
alias date-iso 'date -u +"%Y-%m-%dT%H:%M:%SZ"'

alias mac 'ifconfig | grep HWaddr | awk \'{print $1 " " $5}\''  # MAC address of your network devices.
alias eth0ip "ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print \"eth: \" \$1}'"  # Wired IP address.
alias wlan0ip "ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print \"wlan: \" \$1}'"  # Wireless IP address.
alias serve 'eth0ip; and wlan0ip; and python -m SimpleHTTPServer; or python -m http.server'  # Serves current directory on local network, port 8000.

alias imagify 'jp2a --colors'
# Displays a JPEG image as coloured ASCII in stdout.
# Also check out picture-tube which is for PNGs.
# Usage: imagify file1, file2, ...

# alias combinepdfs 'convert -density 200'
# Combines PDFs vertically.
# Usage: combinepdfs infile1, infile2, ..., outfile
# Alternatives: pdfunite, pdftk

alias hilite-stdout 'pcregrep --colour --multiline ".|\n"'
# Highlights STDOUT in red so you can differentiate between STDOUT and STDERR.
# Usage: my_prog | hilite-stdout

### Git

alias glog "git log --graph \
            --abbrev-commit \
            --date=relative \
            --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset'"
alias grm "git status -sb | grep ' D ' | sed 's/^ D //' | xargs git rm"
alias ggrep 'git grep --line-number --heading --break --show-function'
alias gup 'git fetch --all; and git rebase --preserve-merges origin/(git_branch_name)'

function gr -d "Checkout a recent git branch"
  set -l preview_cmd 'command git show --name-only -n 5 {}'
  set -l branch (git recent | fzf --header="SELECT BRANCH TO CHECKOUT" --preview=$preview_cmd)
  command git checkout $branch
end

# Anything you don't want to share? Put it in here!
if test -f ~/.config/fish/local.config.fish
  source ~/.config/fish/local.config.fish
end
starship init fish | source
