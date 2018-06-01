<div align='center'>
    <h1>squash</h1><br>
</div>

`squash` is a dead simple theme manager for unix systems.
Themes are defined in pure shell scripts, allowing for squash to be both flexible and increadibly simple. 
`squash` takes theme information, applies it to active applications,
and writes files in various formats to be used by other programs. 

<img src="https://imgur.com/zmk2y1m.gif" alt="gif" align="center" width="500px">

## Theory

`squash` is a set of themeing utilities designed to be modular and user friendly.
Creating a cohesive unix-system can be a difficult task, as programs read theme 
information in different formats and in different locations.
`squash` provides a collection of scripts to make managing your system easier. 

The program starts with a `squash` file: a pure bash script that defines how a single
theme will behave (i.e. 16 colors, wallpaper, which bar script to run, what window border color
to use, etc). `squash` sources these values, and applies them to system applications such as `urxvt`, 
`xterm`, `dunst`, `lemonbar`, `polybar`, and your respective window manager. 
In addition, `squash` translates this information into a css file and a xdefaults file to be used
by `~/.Xresources`. 

However, if you don't want `squash` to manage your system for you, then you can use the included
scripts to create a unique environment. Each major `squash` function is included in its own
standalone script, which can be used by any client and does not depend on `squash` variables. 

## Installation

Installing and setting up squash should be fairly simple. Follow these steps:

1) Clone the repository:
    ```bash
    git clone https://github.com/JLErvin/squash
    ```

2) Create the theme directory and move themes there
    ```bash
    cd squash
    mkdir ~/.config/squash
    cp themes/* ~/.config/squash/
    ```

3) Set the defaults. Change the values in the `defaults` file

4) Source `squash` files for xorg. Add the following to the top of your `.Xresources`
    ```xdefaults
    #include ".cache/squash/x_colors"
    ```

5) Switch to your first theme!
    ```bash
    squash designr
    ```

## Configuration

### .Xresources

For colors to persist on new terminals, and for the colors to be used by `x` applications, 
add the following to your `$HOME/.Xresources`

```xdefaults
#include ".cache/squash/x_colors"
```

### BSPWM

For bspwm to use variables define by squash, add the following to your `bspwmrc`

```bash
source "${HOME}/.cache/squash/colors"
bspc config normal_border_color "${BSPWM_NORMAL}"
bspc config focused_border_color "${BSPWM_FOCUSED}"
```

### Windowchef

Windowchef configuration is almost identical to bspwm configruation, 
simply add the following to `windowchefrc`

```bash
source "${HOME}/.cache/squash/colors"

waitron wm_config internal_border_width 5 
waitron wm_config internal_color_focused "${TWOBWM_FOCUS:1:7}"
waitron wm_config internal_color_unfocused "${TWOBWM_UNFOCUS:1:7}"

waitron wm_config border_width 10
waitron wm_config color_focused "${BG:1:7}"
waitron wm_config color_unfocused "${BG:1:7}" 
```

This gives a double border look much like 2bwm.
Notice that in `windowchefrc` you must use hex colors
without the #, hence shortening the hex code. 

## Using built-in bars

`squash` comes pre-loaded with two simple lemonbar scripts, `blockbar` and `simplebar`.
Both scripts change icon colors based on system status (i.e. the battery icon will turn red
when the battery is below a certain threshold, etc). Many of the themes I have created
are optimized to work best with these scripts. 

To use these scripts, add them to your path. Which bar is used for which theme is determined 
in the given theme's configruation file under the `BAR_SCRIPT` variable.

To change the scripts general behavior, edit the `bar_defaults` file found in the `bar` directory. 

NOTE: These scripts may require some tweaking to work with your system. Elements like battery/audio levels
may depend on what backends you use. 

#### blockbar
![Screenshot](https://i.imgur.com/aic9jPm.png)
#### simplebar
![Screenshot](https://i.imgur.com/Kxx9Yps.png)
