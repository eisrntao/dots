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
# Init zoxide
eval "$(zoxide init zsh)"
# Init starship
eval "$(starship init zsh)"

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

