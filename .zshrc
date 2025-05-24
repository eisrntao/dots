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

zstyle ':completion:*' menu select # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# Keybinds
bindkey '^[.' insert-last-word

# Rebind Ctrl-R to fzf in vi mode
bindkey -M viins '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Init zoxide
eval "$(zoxide init zsh)"
# Init starship
eval "$(starship init zsh)"

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
alias cd="z"
alias v="nvim"
alias lazy="lazygit"

# Launch on startup
macchina
