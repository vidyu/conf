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

import subprocess
from subprocess import call

import os

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook


# reconfigure screens
# call("./bin/setup_screens")


##-> Theme + widget options
class Theme(object):
    "Class for the theme"
    bar = {
        'size': 24,
        'background': '15181a',
        }
    widget = {
        'font': 'Andika',
        'fontsize': 11,
        'background': bar['background'],
        'foreground': '00ff00',
        }
    graph = {
        'background': '000000',
        'border_width': 0,
        'border_color': '000000',
        'line_width': 1,
        'margin_x': 0,
        'margin_y': 0,
        'width': 50,
        }
    groupbox = widget.copy()
    groupbox.update({
        'padding': 2,
        'borderwidth': 3,
        })
    sep = {
        'background': bar['background'],
        'foreground': '444444',
        'height_percent': 75,
        }
    systray = widget.copy()
    systray.update({
        'icon_size': 16,
        'padding': 3,
        })
    pacman = widget.copy()
    pacman.update({
        'foreground': 'ff0000',
        'unavailable': '00ff00',
        })
    battery = widget.copy()
    battery_text = battery.copy()
    battery_text.update({
        'low_foreground': 'FF0000',
        'charge_char': "↑ ",
        'discharge_char': "↓ ",
        'format': '{char}{hour:d}:{min:02d}',
        })

mod = "mod4"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.up()),
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    # Move windows up or down in current stack
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),



    
    

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("xterm")),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),
    Key([mod, "control"], "o", lazy.next_screen()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),

    Key([mod, "control"], "space", lazy.widget['keyboardlayout'].next_keyboard())
]

groups0 = [Group(i) for i in "uiop"]

for i in groups0:
    # mod1 + letter of group = switch to group
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen(0))
    )

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
    )

groups1 = [Group(i) for i in "asdf"]

for i in groups1:
    # mod1 + letter of group = switch to group
    keys.append(
        Key([mod], i.name, lazy.group[i.name].toscreen(1))
    )

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name))
    )

layouts = [
    layout.Columns(num_columns=2, autosplit=True),
    layout.Max()
]

widget_defaults = dict(
    font='Arial',
    fontsize=16,
    padding=3,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(urgent_alert_method='text', **Theme.groupbox),
                widget.CurrentLayout(**Theme.widget),
                widget.Prompt(**Theme.widget),
                widget.WindowName(**Theme.widget),
                widget.KeyboardLayout(update_interval=1, configured_keyboards=['us', 'bg phonetic'], **Theme.widget),
                widget.Systray(**Theme.systray),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p', **Theme.widget),
            ],
            30,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.WindowName(**Theme.widget),
                widget.CurrentLayout(**Theme.widget),
            ],
            30,
        ),
    )
]

##-> Floating windows
floating_layout = layout.floating.Floating(float_rules=[{'wmclass': x} for x in (
    'Download',
    'dropbox',
    'skype',
    'file_progress',
    "notification",
    "toolbar",
    "splash",
    "dialog",
    )])




@hook.subscribe.startup_once
def autostart():
    "Sets the wallpapper up"
    setup_wallpaper = os.path.expanduser('~/.config/qtile/bin/setup_wallpaper')
    subprocess.call([setup_wallpaper])

@hook.subscribe.client_new
def floating_dialogs(window):
    dialog = window.window.get_wm_type() == 'dialog'
    popup = window.window.get_wm_type() == 'popup'
    transient = window.window.get_wm_transient_for()
    if (dialog or transient) or popup:
        window.floating = True


# # look for new monitor
# @hook.subscribe.screen_change
# def restart_on_randr(qtile, ev):
#     call("./bin/setup_screens")
#     qtile.cmd_restart()



# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
