<div align='center'>
    <h1>squash</h1><br>
</div>

`squash` is a dead simple theme manager for unix systems.
Themes are defined in pure shell scripts, allowing for squash to be both flexible and increadibly simple. 
`squash` takes theme information, applies it to active applications,
and writes files in various formats to be used by other programs. 

Predefined themes are available in the `themes` directory. 
Add your own themes using the `template` file.
When you are ready, change themes with: 

```
squash <THEME>
```

Squash currently supports the following window managers:

* 2bwm
* bspwm
* windowchef

## Theory

Managing themes on unix systems can often be difficult. 
Nearly every program stores their theme files in different locations
and in different formats. 
Squash aims to consolidate theme information into a single location. 
These files can then be used to quickly apply themes to the entire system.

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
