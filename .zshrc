export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"  # This loads nvm bash_completion

export DENO_INSTALL="/home/angel/.deno"
export PATH="$DENO_INSTALL/bin:/home/angel/.local/bin:~/.config/emacs/bin:$PATH"

eval "$(starship init zsh)"

pfetch

alias zshconfig="nvim ~/.zshrc"
alias qconfig="nvim ~/.config/qtile/config.py"
alias hyprconfig="nvim ~/.config/hypr/hyprland.conf"
alias wconfig="cd ~/.config/waybar/ && nvim . && cd -"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cat="bat"
alias upbg='wal -a 90 -qi "$(swww query | swww query | cut -d" " -f8)"'

setbg() {
  swww img --transition-step 60 $1
  wal -a 90 -qi $1
}
