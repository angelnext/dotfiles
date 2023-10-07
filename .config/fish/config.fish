fish_ssh_agent

if status is-interactive
  set_color "#FF19B1"
  prompt
  set_color white
end

alias grep "batgrep"

fish_add_path ~/.local/bin

set -gx GPG_TTY (tty)
