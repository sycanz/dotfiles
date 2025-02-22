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
alias prev="fzf --preview 'bat --color=always {}' --preview-window '~3'"
alias ta="tmux attach"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf stuffs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

# compile/run java files
function jc() {
    if [ $# -eq 0 ]; then
        echo "Usage: $0 <JavaFileName.java>"
    fi
    
    file=$1
    
    if [ ! -f "$file" ]; then
        echo "Error: File $file not found!"
    fi
    
    classname=$(basename "$file" .java)
    
    javac "$file"
    
    if [ $? -eq 0 ]; then
        # echo "Compilation successful! Running $classname..."
        # echo "----------------------------------------"
        java "$classname"
    else
        echo "Compilation failed!"
    fi
}

eval "$(zoxide init zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Added by `rbenv init` on Thu Oct 24 08:03:20 PM +08 2024
eval "$(rbenv init - --no-rehash zsh)"
export PATH=$PATH:/home/sycanz/.local/bin
