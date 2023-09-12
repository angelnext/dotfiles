function ls --wraps='exa --icons -F -H --group-directories-first --git -1' --description 'alias ls exa --icons -F -H --group-directories-first --git -1'
  eza --icons -a -F -H --group-directories-first --git $argv     
end
