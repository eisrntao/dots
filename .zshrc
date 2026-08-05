# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ignore commands that start with spaces and duplicates.

export HISTCONTROL=ignoreboth

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Don't add certain commands to the history file.

export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use custom `less` colors for `man` pages.

export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.

export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
#alias open="xdg-open"
alias make="make -j`nproc`"
alias ninja="ninja -j`nproc`"
alias n="ninja"
alias c="clear"
alias rmpkg="sudo pacman -Rsn"
alias cleanch="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias update="sudo pacman -Syu"

# Help people new to Arch
alias apt="man pacman"
alias apt-get="man pacman"
alias please="sudo"
alias tb="nc termbin.com 9999"

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# pkgfile "command not found" handler
source /usr/share/doc/pkgfile/command-not-found.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export FZF_BASE=/usr/share/fzf

# -- END OF CACHYOS CONFIG --

# Import vars
source $HOME/.zprofile

# Change history
HISTFILE=~/.cache/.zshhistory
HISTSIZE=10000
SAVEHIST=10000

# Load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# Autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(completion history )
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'   # dim gray
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Completion UX tweaks (you already have some; these add a bit more) ---
setopt complete_in_word always_to_end
zstyle ':completion:*' group-name ''                   # group results
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' \
                                      'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  # smarter matching
zstyle ':completion:*' menu select # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# --- Completion UX tweaks
setopt complete_in_word always_to_end
zstyle ':completion:*' group-name ''                   # group results
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' \
                                      'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  # smarter matching
zstyle ':completion:*' menu select # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# Source vim motions
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
function zvm_after_init() {
  bindkey -M viins '^Y' autosuggest-accept    # Ctrl-Y accepts suggestion in insert mode
}

# Syntax highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Keybinds
bindkey '^[.' insert-last-word

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Init mcfly
eval "$(mcfly init zsh)"
export MCFLY_FUZZY=3
export MCFLY_DELETE_WITHOUT_CONFIRM=TRUE
# Init zoxide
eval "$(zoxide init zsh)"

# main opts
setopt hist_ignore_dups     # don’t record duplicate commands
setopt hist_ignore_all_dups # remove older duplicates
setopt hist_reduce_blanks   # trim excess spaces
setopt hist_ignore_space    # lines starting with space are not saved
setopt extended_history          # write the history file in the ':start:elapsed;command' format.
setopt inc_append_history        # write to the history file immediately, not when the shell exits.
setopt share_history             # share history between all sessions.
setopt hist_expire_dups_first    # expire a duplicate event first when trimming history.
setopt hist_find_no_dups         # do not display a previously found event.
setopt hist_save_no_dups         # do not write a duplicate event to the history file.
setopt hist_verify               # do not execute immediately upon history expansion.
setopt append_history            # append to history file
setopt hist_no_store             # don't store history commands

setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines

# Aliases
alias ls="exa"
alias grep="rg"
alias cat="bat"
alias du="dust"
alias cd="z"
alias v="nvim"
alias lazy="lazygit"
alias py="python"
alias b="bartib"

diff() {
  command diff "$@" | diff-so-fancy
}

function kindle() {
  if [[ $1 = "cp" ]]; then
    scp $2 "kindle:/mnt/us/documents/"
  else
    echo "Wrong argument, available are:"
    echo "kindle cp [FILE]"
  fi
}

function clip-aggregate() {
cliphist list | while IFS= read -r line; do
  echo "$line" | cliphist decode
done | wl-copy
}
