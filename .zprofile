# Export default variables
export EDITOR="nvim"
export TERM="alacritty"
export TERMINAL="alacritty"
export MUSPLAYER="youtube-music"
export BROWSER="qutebrowser"

export SCRIPT_DIR=$HOME/scripts
export WALLPAPER_DIR=$HOME/Pictures/wallpapers
export HYPRSHOT_DIR=$HOME/Pictures/screenshots

export BARTIB_FILE=~/.cache/bartib.txt

# Setup ssh-agent

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
fi

trap 'test -n "$SSH_AUTH_SOCK" && eval `/usr/bin/ssh-agent -k`' 0
