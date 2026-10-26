# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=30000
setopt SHARE_HISTORY
unsetopt beep
bindkey -e

# load dircolors
eval `dircolors ~/Themes/bliss-dircolors/bliss.dircolors`
alias ls='ls --color=auto'

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rzsiah/.zshrc'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit
# End of lines added by compinstall

# load autosuggestions plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Configure PATH
export PATH=$PATH:/home/rzsiah/.local/bin

# zoxide
eval "$(zoxide init zsh)"
alias cd=z

# eza
alias ls=eza

# bat
alias bat=batcat

PROMPT='%F{81}%n%f %F{195}%~%f%F{123}>%f '

alias rbt='sudo efibootmgr -n 0001 && reboot'
alias rbtfw='systemctl reboot --firmware-setup'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias run="./a.out"

alias evalsh="$HOME/Code/42/eval/eval/eval.sh"

function launch() {
	nohup "$@" >/dev/null 2>&1 &
	disown
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
