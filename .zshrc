export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DENO_INSTALL="/home/angel/.deno"
export PATH="$DENO_INSTALL/bin:/home/angel/.local/bin:$PATH"

eval "$(starship init zsh)"

neofetch


alias zshconfig="nvim ~/.zshrc"
alias qconfig="nvim ~/.config/qtile/config.py"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
