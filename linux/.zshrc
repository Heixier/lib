# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=30000
setopt SHARE_HISTORY
unsetopt beep
bindkey -e

PROMPT='%F{81}%m@%n%f %F{195}%~%f%F{123}>%f '

# load dircolors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rzsiah/.zshrc'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Source zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Configure PATH
export PATH=$PATH:/home/rzsiah/.local/bin

# zoxide
eval "$(zoxide init zsh)"
alias cd=z

# eza
alias ls=eza

alias rbtfw='systemctl reboot --firmware-setup'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias run="./a.out"

alias open="xdg-open"

function launch() {
	nohup "$@" >/dev/null 2>&1 &
	disown
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
sleep 0.3 # TUIOS bug

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function f() {
	fzf --style minimal --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}' --bind 'enter:become(vim {})' --walker-root="${1:-.}"
}
