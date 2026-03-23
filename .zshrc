HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

source ~/.oh-my-zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# init services
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"

# Aliases
alias zs="source ~/.zshrc"
alias zc="v ~/.zshrc"
alias v="nvim"
alias c="clear"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias env="source .venv/bin/activate"
alias hi="python3 main.py"
alias lg="lazygit"
alias prev="fzf --preview 'bat --color=always {}' --preview-window '~3'"
alias ta="tmux attach"
alias gst="git status"
alias gsw="git switch"
alias gsh="git stash"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias tc="v ~/.tmux.conf"
alias cursor="~/applications/Cursor-1.3.8-x86_64.AppImage"
alias zz="z .."
alias dec="conda deactivate"
alias docker-start="sudo systemctl start docker.service docker.socket"
alias docker-stop="sudo systemctl stop docker.service docker.socket"
alias docker-status="sudo systemctl status docker"
alias typst-resume="docker run --rm -v "$PWD":/workspace -w /workspace ghcr.io/typst/typst:0.14.2 compile resume.typ --font-path fonts"

# fzf stuffs
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# downloads tpm if it doesn't exist
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

export PATH="$HOME/.local/bin:$PATH"

# env for ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

function init_conda() {
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/sycanz/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/sycanz/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/sycanz/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/sycanz/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # !! Contents within this block are managed by 'conda init' !!
}

# run and compiles java files
function rc_java() {
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
