export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

source ~/.oh-my-zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Aliases
alias zs="source ~/.zshrc"
alias zc="v ~/.zshrc"
alias v="nvim"
alias c="clear"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias env="source env/bin/activate"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"
