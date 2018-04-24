# squash

A dead simple program for applying user-created themes to unix systems. 

Unlike many themeing programs, squash uses shell scripts for configuration. 
This makes squash very extensible, and allows all information about a theme
to be stored in a single shell script. 

The most basic `squash` theme files look like:

``` bash
#!/bin/bash

# DEFINE COLORS
BG="#20292d"
FG="#c4c4b5"

BLK="#253034"
RED="#a66959"
GRN="#769070"
YLW="#ac8d6e"
BLU="#607a86"
MAG="#8a757e"
CYN="#60867f"
WHT="#c4c4b5"

BBLK="#35444b"
BRED="#a66959"
BGRN="#769070"
BYLW="#ac8d6e"
BBLU="#607a86"
BMAG="#8a757e"
BCYN="#60867f"
BWHT="#c4c4b5"

# ROFI OPTIONS
ACC="${RED}"

# BAR OPTIONS
BAR_SCRIPT="infobar2"

# VIM COLORSCHEME
VIM_SCHEME='bleh'

# WALLPAPER OPTIONS
WALLPAPER_PATH="$HOME/Wallpapers/designr2.png"
WALLPAPER_STYLE="tile"

# 2BWM OPTIONS
TWOBWM_FOCUS="${YLW}"
TWOBWM_UNFOCUS="${BLU}"
TWOBWM_FIXED="${RED}"
TWOBWM_UNKILL="${CYN}"
TWOBWM_FIXEDUNK="${MAG}"
TWOBWM_OUTR="${BG}"
TWOBWM_EMP="${BG}"
```


# Theory

Managing colors on unix systems can often be very difficult. Almost every program stores their files in different locations and in different formats. Squash aims to put all of these colors in a single location so they are easier to manage and understand. Each theme gets its own file, and squash can be used to source those files and apply colors to various programs. First, squash is able to send escape codes to urxvt terminals, meaning all terminal colors are reloaded on the fly. Squash also writes its own files to `$HOME/.cache/squash` to be sourced by other programs. For example, it writes a `colors.css` file to be used with applications like firefox. 

Squash goes a step further, however, and recognizes that different themes don't always apply the same. For example, using a colorscheme like `soloarized`, you might want your window borders to be yellow. In other colorschemes, however, this might be unpleasant, so you can specify a different border color for something like `gruvbox`. Squash is built to work with 2bwm, but it is easy to exapand it to work with other applications. 

Finally, squash comes with its own bar, `sqbar` that runs on `lemonbar`. It uses squash variables to create a simple minimal bar. If you wish to use your own bar, however, all you have to do is change the `BAR_SCRIPT` variable in your theme file. 

# Usage

`squash <theme>`

`squash` comes preloaded with a set of themes for you to use. Move these themes to `~/.config/squash/themes` (or redefine the theme `dir` in `squash`). 

### urxvt/xterm

`squash` will automatically reload all active terminals with the new colorscheme. 
To make these colors persist on new terminals, add the following to your `.Xresources`:

```c
#include ".cache/squash/x_colors"
```

These changes will be merged with the current `.Xresources`. This means that all active programs
are able to see these changes. For example, a call to refresh `polybar` using `xrdb` would
see the new colors and apply them accordingly. 
