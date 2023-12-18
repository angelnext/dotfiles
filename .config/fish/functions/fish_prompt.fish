function fish_prompt
    set -l symbol ' $ '
    set -l color $fish_color_cwd
    if fish_is_root_user
        set symbol ' # '
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

    set_color "#71FE91"
    echo -n (prompt_pwd)
    set_color normal

    echo -n $symbol
end
