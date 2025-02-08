# Introduction 🐈
I'm using this repo as a way to save all my dotfiles and somewhat keep track of [my linux journey](https://docs.google.com/document/d/1B-zTeHiim_inIiL5ZpCpm374C9v6SGFBlfq2XCstE50/edit?usp=sharing) because why not :)

## My tools 🔨
| Tools                |                              |
| :------------------- | :--------------------------- |
| Shell / prompt       | Oh-my-zsh / Starship         | 
| Terminal             | Wezterm                      |
| Fonts                | JetBrains Mono Nerd Font     |
| Editor               | Nvim (lazy.nvim)             | 
| Terminal Multiplexer | Tmux                         |
| Desktop Environment  | Gnome-COSMIC (Pop_OS!)       |
| Colourscheme         | Catppuccin-Mocha             |

## Installation ⬇️
According to [this tutorial](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/), the installation steps are:
1. Add `.cfg` into .gitignore to avoid recursive issues
```
echo ".cfg" >> .gitignore
```
2. Clone the repo, add `--bare` flag if you wish to use a bare repo (recommended)
```
git clone <remote-git-repo-url> $HOME/.cfg
```
3. Set up an alias that sends Git commands to `.cfg`, also set `$HOME` as the work tree, while storing the Git state at `.cfg`
```
alias config='/usr/bin/git --git-dir=<path to .cfg’s Git directory> --work-tree=$HOME'
```
4. Checkout the actual content from `.cfg`. It might fail because your computer has similar file names in `.cfg`
```
config checkout
``` 

## Nvim config
Since lazy.nvim is already bootloaded. Just go into `.config/nvim/lua/config/lazy.lua` or any file in neovim

Run:
```
:Lazy sync
```

## Tmux config
The prefix of my config is `C-s`
1. Install [TPM](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation).
2. Source `.tmux.conf` with shortcut `Prefix + r` or
```
tmux source .tmux.conf
```
3. Install plugin with TPM by using `Prefix + I`
