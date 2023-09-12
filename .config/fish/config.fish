if status is-interactive
  set_color "#a659ff"
  prompt
  set_color white
end

fish_add_path ~/.local/bin

set -gx GPG_TTY (tty)
