fish_ssh_agent

fish_add_path /home/angel/.spicetify

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

oh-my-posh init fish --config "$XDG_DATA_HOME/oh-my-posh/catppuccin.omp.json" | source
