# Import vars
source $HOME/.zprofile

# Change history
HISTFILE=~/.cache/.zshhistory
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups     # don’t record duplicate commands
setopt hist_ignore_all_dups # remove older duplicates
setopt hist_reduce_blanks   # trim excess spaces
setopt hist_ignore_space    # lines starting with space are not saved

# Load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# Source vim motions
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Init zoxide
eval "$(zoxide init zsh)"
# Init starship
eval "$(starship init zsh)"

zstyle ':completion:*' menu select # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# Keybinds
bindkey '^[.' insert-last-word

# main opts
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# Setup yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"

}
# Aliases
alias yazi="y"
alias ls="exa"
alias grep="rg"
alias find="fd"
alias cat="bat"
alias du="dust"
alias cd="z"
alias v="nvim"
alias lazy="lazygit"

# Launch on startup
