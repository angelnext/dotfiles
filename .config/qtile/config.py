# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import re
import socket
import subprocess

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from libqtile.scripts.main import VERSION

from typing import List 

mod = "mod4"
terminal = guess_terminal()

colors = [["#282c34", "#282c34"],
          ["#1c1f24", "#1c1f24"],
          ["#dfdfdf", "#dfdfdf"],
          ["#ff6c6b", "#ff6c6b"],
          ["#98be65", "#98be65"],
          ["#da8548", "#da8548"],
          ["#51afef", "#51afef"],
          ["#c678dd", "#c678dd"],
          ["#46d9ff", "#46d9ff"],
          ["#a608dd", "#a608dd"]]

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
# Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "b", lazy.spawn("brave"), desc="Launch browser"),
    Key([mod], "e", lazy.spawn("alacritty -e ranger"), desc="Launch file manager"),
    Key([mod], "d", lazy.spawn("vencord"), desc="Launch Discord (Vencord)"),

    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([mod], "r", lazy.spawn("rofi -show run"), desc="Spawn a command using rofi"),
    Key([mod, "shift"], "r", lazy.spawn("rofi -show drun"), desc="Spawn an application using rofi"),

    Key([], "XF86AudioLowerVolume", lazy.spawn("/home/angel/.local/bin/changevolume down"), desc="Lower Volume by 5%"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("/home/angel/.local/bin/changevolume up"), desc="Raise Volume by 5%"),
    Key([], "XF86AudioMute", lazy.spawn("/home/angel/.local/bin/changevolume mute"), desc="Mute/Unmute Volume"),

    Key([], "XF86MonBrightnessUp", lazy.spawn("/home/angel/.local/bin/changebrightness up")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("/home/angel/.local/bin/changebrightness down")),
    
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),

    Key([], "Print", lazy.spawn("flameshot gui")),
    KeyChord([mod], "z", [
        Key([], "x", lazy.spawn("xterm -bg #100026 -fg #fff -p 10 1"))
    ])
]


groups = [
    Group("1", label="DEV"),
    Group("2", label="WWW"),
    Group("3", label="CHAT"),
    Group("4", label="MUS"),
    Group("5", label="DES"),
    Group("6", label="EDU"),
    Group("7", label="TORR"),
    Group("8", label="MISC"),
    Group("9", label="VIRT"),
]

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    # layout.Bsp(border_focus="#a608dd", border_width=0, border_on_single=True, margin=8),
    layout.Columns(border_width=2, border_focus="#aaa", margin=4),
    #layout.Max(),
    # layout.Matrix(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(border_focus="#a608dd", border_width=0, border_on_single=True, margin=8),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
] 

widget_defaults = dict(
    font="Caskaydia Cove Nerd Font",
    fontsize=11,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper_mode='stretch', 
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth = 0,
                    padding = 10,
                ), 
                widget.GroupBox(
                    fontsize = 13,
                    highlight_method='block', 
                    active="#fff",
                    inactive="#afafaf",
                    this_current_screen_border = "#371BBC",
                    border = "#fff",
                    margin_y = 3,
                    margin_x = 4,
                    padding_y = 7,
                    padding_x = 5,
                    rounded = True,
                    use_mouse_wheel=False,
                ),

                widget.WindowName(
                    fontsize = 8,
                    padding = 20,
                    foreground = "#d0d0f0",
                ),  

                widget.Systray(
                    padding = 12,
                ),

                widget.Sep(
                    linewidth = 0,
                    padding = 10,
                ),

                widget.Sep(
                    linewidth = 2,
                ),

                widget.Memory(
                    mouse_callbacks = {'Button1': lazy.spawn("alacritty -e htop")},
                    padding = 10,
                    fontsize = 14,
                ), 

                widget.Sep(
                    linewidth = 2,
                ),

                widget.Clock(
                    format = "%Y/%m/%d %H:%M:%S ", 
                    padding = 10,
                    fontsize = 14,
                    mouse_callbacks = { 'Button1': lazy.spawn("alacritty -e calcurse") }
                ),  
            ],
            50,
            background="#201156",
            opacity=0.8,
            margin = 4,
        ), 
    ),
]

import os
import subprocess

from libqtile import hook

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])


@hook.subscribe.client_new
def client_new(client):
    if client.name.startswith("Discord") or "Vencord" in client.name:
        client.togroup('3')

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = f"Qtile {VERSION}"
