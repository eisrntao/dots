# Export default variables
export EDITOR="nvim"
export TERM="ghostty"
export TERMINAL="ghostty"
export MUSPLAYER="pear-desktop"
export BROWSER="helium"

export SCRIPT_DIR=$HOME/scripts
export WALLPAPER_DIR=$HOME/Pictures/wallpapers
export SCREENSHOT_DIR=$HOME/Pictures/screenshots

export BARTIB_FILE=~/Documents/bartib.txt

# Setup ssh-agent

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
fi

trap 'test -n "$SSH_AUTH_SOCK" && eval `/usr/bin/ssh-agent -k`' 0
