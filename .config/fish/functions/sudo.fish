function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        eval command doas $history[1]
    else
        command doas $argv
    end
end
