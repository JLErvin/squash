# squash

squash is a theme manager for unix systems.
It is desinged to manage and apply user-created themes on a variety of window managers and applications.
squash is not intended to be an automatic themer like `wal` -
instead it is desinged to save and quickly apply user-created themes.

![Screenshot](https://i.imgur.com/5xRtWrY.png)

## Install

Download `squash` from github

```
git clone https://github.com/JLErvin/squash
```

You will need to edit `squash` to point to your themes and desired colors directory. 
You can do this by changing the first couple lines in `squash`. They default to the following:

* `THEMES_DIR=~/.config/squash/themes`
* `CACHE_DIR=~/.cache/squas`
* `OB_DIR=~/.local/share/themes/generic/openbox-3`


After these have been set, you can change your other applications to point to these directories. 
Examples of these are provided in the Usage section. 

For ease of use, add squash to your path. That will most likely look like this in your bashrc:

`PATH=~/squash:$PATH`

Finally, make `squash` executable:

`chmod +x squash`

Based on what functions you would like squash to use, you will need to create these directories
yourself. For example, you will need to make your own directory for themes. 

## Usage

`squash <THEME>`

Assuming the install worked correctly, you should now have a `squash` folder in your .config directory

Inside the `themes` direcotry you will find some colorschemes created by `crayolo`. You can add as many themes as you want here. I have also added some of my favorite themes such as
`solarized light` `solarized dark` and `oceanic next`.

### Xresources

To apply squash to `.Xresources`, use the following template.

``` ini
#include </home/jlervin/.cache/squash/colors>

! Colors
*background:   bg
*foreground:   fg
*color0:      blk
*color8:      bblk
*color1:      red
*color9:      bred
*color2:      grn
*color10:     bgrn
*color3:      ylw
*color11:     bylw
*color4:      blu
*color12:     bblu
*color5:      mag
*color13:     bmag
*color6:      cyn
*color14:     bcyn
*color7:      wht
*color15:     bwht

! ------------------------------------------------------------------------------
! ROFI Color theme
! ------------------------------------------------------------------------------
rofi.color-enabled: true
rofi.color-window: bg, bg, bg
rofi.color-normal: bg, fg, bg, fg, bg
rofi.color-active: #fdf6e3, #268bd2, #eee8d5, #268bd2, #fdf6e3
rofi.color-urgent: #fdf6e3, #dc322f, #eee8d5, #dc322f, #fdf6e3
rofi.width: 10
rofi.font: UW ttyp0 12
```

### Lemonbar

Place the following lines in your `bar.sh` script. In addition, you will need to
add variable names to your different bar components.

``` bash
source "/home/jlervin/.cache/squash/colors.sh"
```

### Openbox

`squash` will automatically create the necessary openbox configuration file for you.
However, for themes to be dynamically applied, you must set your openbox theme
to `generic` using a program such as `obconf` or `lxappearance`. Openbox does not need
to be restarted for themes to take effect.

### Polybar

Place the following lines at the top of your polybar configuration file.
Use the decalared variable names to apply these colors to your bar.

It should be noted that if you do not apply `squash`
to your `.Xresources`, then this method will not work when applying this to `tmux`.


``` .ini
[colors]

background=${xrdb:background:#ffffff00a}
foreground=${xrdb:foreground:#ffffff}

red=${xrdb:color1:#ffffff}
bred=${xrdb:color9:#ffffff}

grn=${xrdb:color2:#ffffff}
bgrn=${xrdb:color10:#ffffff}

ylw=${xrdb:color3:#ffffff}
bylw=${xrdb:color11:#ffffff}

blu=${xrdb:color4:#ffffff}
bblu=${xrdb:color12:#ffffff}

mag=${xrdb:color5:#ffffff}
bmag=${xrdb:color13:#ffffff}

cyn=${xrdb:color6:#ffffff}
bcyn=${xrdb:color14:#ffffff}

black=${xrdb:color0:#ffffff}
grey=${xrdb:color8:#ffffff}

white=#EAEAED
```

### Tmux

Tmux is able to apply colors using `.Xresources`. Use the following example to color
your various `tmux` elements.

It should be noted that if you do not apply `squash`
to your `.Xresources`, then this method will not work when applying this to `tmux`.

```
set -g TMUX-MODULE-NAME '#[fg=colour15,bg=colour0] #S:#I #[fg=default,bg=default] '
```

### Firefox

```
@import "file://home/USERNAME/.cache/squash/colors.css";
```









