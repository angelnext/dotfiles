from libqtile.dgroups import simple_key_binder
from libqtile.backend.wayland import InputConfig
from libqtile import hook
import os
import subprocess

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from libqtile.scripts.main import VERSION

mod = "mod4"

colors = [
    "#471bbc"
]

keys = [
    Key(
        [mod],
        "h",
        lazy.layout.left(),
        desc="Move focus to left"
    ),

    Key(
        [mod],
        "l",
        lazy.layout.right(),
        desc="Move focus to right"
    ),

    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),

    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),

    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"
    ),

    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key(
        [mod, "control"], "j",
        lazy.layout.grow_down(),
        desc="Grow window down"
    ),

    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    Key(
        [mod],
        "Return",
        lazy.spawn("alacritty"),
        desc="Launch terminal",
    ),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "b", lazy.spawn("brave"), desc="Launch browser"),
    Key([mod], "e", lazy.spawn("alacritty -e ranger"),
        desc="Launch file manager"),
    Key([mod], "d", lazy.spawn("discord"), desc="Launch Discord"),

    Key([mod], "t", lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([mod], "r", lazy.spawn("rofi -show drun"),
        desc="Spawn an applications using rofi"),
    Key([mod, "shift"], "r", lazy.spawn("rofi -show run"),
        desc="Spawn a command using rofi"),

    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "/home/angel/.local/bin/changevolume down"),

        desc="Lower Volume by 5%"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "/home/angel/.local/bin/changevolume up"), desc="Raise Volume by 5%"),

    Key([], "XF86AudioMute", lazy.spawn(
        "/home/angel/.local/bin/changevolume mute"),
        desc="Mute/Unmute Volume"),

    Key([], "XF86MonBrightnessUp", lazy.spawn(
        "/home/angel/.local/bin/changebrightness up")),
    Key([], "XF86MonBrightnessDown", lazy.spawn(
        "/home/angel/.local/bin/changebrightness down")),

    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),

    Key([], "Print", lazy.spawn("flameshot gui")),
]

c = ["DEV", "WWW", "CHAT", "MUS", "DES", "EDU", "TORR", "MISC", "VIRT"]

groups = [Group(i) for i in c]


layouts = [layout.Columns(
    border_width=2, border_focus="#aa30ff", margin=4, border_on_single=True),]

widget_defaults = dict(
    font="Caskaydia Cove Nerd Font",
    fontsize=11,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    padding=5,
                ),

                widget.GroupBox(
                    fontsize=12,
                    highlight_method='block',
                    active="#fff",
                    inactive="#cfcfdf",
                    this_current_screen_border="#aad",
                    block_highlight_text_color="#00001f",
                    margin_y=3,
                    margin_x=0,
                    padding_y=7,
                    padding_x=5,
                    use_mouse_wheel=False,
                ),

                widget.WindowName(
                    fontsize=7,
                    padding=10,
                    foreground="#d0d0f0",
                ),

                widget.Systray(
                    padding=12,
                ),

                widget.Sep(
                    linewidth=0,
                    padding=10,
                ),

                widget.Sep(
                    linewidth=2,
                ),

                widget.Memory(
                    padding=10,
                    fontsize=13,
                ),

                widget.Sep(
                    linewidth=2,
                ),

                widget.Clock(
                    format="%Y/%m/%d %H:%M:%S ",
                    padding=10,
                    fontsize=13,
                ),
            ],
            size=40,
            background="#00001f",
            opacity=0.7,
            margin=4,
        ),
    ),
]


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])


@hook.subscribe.client_new
def client_new(client):
    if "Discord" in client.name:
        client.togroup('3')


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()
    ),

    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),

    Click(
        [mod],
        "Button2",
        lazy.window.bring_to_front()
    ),
]


dgroups_key_binder = simple_key_binder(mod)
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="blueman-manager"),
        Match(wm_class="copyq"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = True
reconfigure_screens = True

auto_minimize = True


wl_input_rules = {
    "1267:12377:ELAN1300:00 04F3:3059 Touchpad": InputConfig(left_handed=True),
    "*": InputConfig(left_handed=True, pointer_accel=True),
    "type:keyboard": InputConfig(kb_options="ctrl:nocaps,compose:ralt"),
}

wmname = f"Qtile {VERSION}"
