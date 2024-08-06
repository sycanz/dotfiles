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
alias hi="python3 main.py"
alias lg="lazygit"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
