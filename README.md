<div align='center'>
    <h1>squash</h1><br>
</div>

`squash` is a dead-simple bash script that allows users to create custom themes and 
quickly apply them to terminals, panels, browsers, and window managers. `squash` stores
themes in pure bash-scripts, allowing it to be extensible and versitile. 

To understand how `squash` interacts with various system applications, check the usage section. 

<img src="https://imgur.com/zmk2y1m.gif" alt="gif" align="center" width="500px">

## Installation

1) Clone the repository and cd into it
    ```sh
    git clone https://github.com/JLErvin/squash
    cd squash
    ```

2)  Move themes and default configuration file into `$HOME/.config`
    ```sh
    mkdir $HOME/.config/squash
    mkdir $HOME/.config/squash/themes
    cp -r themes/* $HOME/.config/squash/themes/
    cp defaults $HOME/.config/squash/defaults

    ```

3) Finally, add `squash` to your path

## Usage

Before running `squash`, it is best to edit the defaults at `$HOME/.config/squash/defaults`
and set which applications you want to be reloaded.

Next, you will want to edit the theme that you are using so it best suits your needs.
Themes are located in `$HOME/.config/squash/themes`. 
For example, you might want to set the `BAR_SCRIPT` variable, which determines what bar `squash` will try to reload. 

Now, switch to your first theme!

```sh
squash designr
```

## Application Usage

`squash` is really just a translator, it takes `squash` theme information and writes it in various file formats
to be used by other applications. 

### urxvt
For example, `squash` generates a `x_colors` file, which can be sourced by `Xresorces` so colors can be used
system-wide. 

To make colors persist on new terminals, add the following to `~/.Xresources`

```xdefaults
#include ".cache/squash/x_colors"
```

### lemonbar

`squash` colors are copied to pure bash scripts so they can be sourced by lemonbar.
Add the following at the top of your script: 

```sh
source $HOME/.cache/squsah/colors
```

### polybar

Because `squash` can be used by `Xresources`, `polybar` will recognize all changes that `squash` makes to these values
upon restart. To see these values, make sure polybar defines colors from `Xresources`

```
blk=${xrdb:color0}
red=${xrdb:color1}
...
bwht=${xrdb:color15}
```

### firefox

`squash` writes a `.css` file. You can source this file and use it to define `firefox` colors

```css
@import "file:///home/jlervin/.cache/squash/colors.css";
```

### bspwm

`bspwm` configuration is really just a bash file.
This means you can source `squash` sh files to get access to all variables
Add the following to your `bspwmrc`

```sh
source "${HOME}/.cache/squash/colors"

bspc config normal_border_color "${BSPWM_NORMAL}"
bspc config focused_border_color "${BSPWM_FOCUSED}"
```

### windowchef

`windowchef` configuration is almost identical to `bspwm` configuration. 
Add the following to your `windowchefrc`

```sh
source "${HOME}/.cache/squash/colors"

waitron wm_config internal_border_width 5 
waitron wm_config internal_color_focused "${TWOBWM_FOCUS:1:7}"
waitron wm_config internal_color_unfocused "${TWOBWM_UNFOCUS:1:7}"
```

### 2bwm

`squash` will reload `2bwm` automatically. It should be noted that `squash` changes that contents of 
`config.h` which may cause syntax errors if colors are not sourced correctly. Use are your own risk. 

### dunst

`squsah` will reload `dunst` automatically with background/foreground colors. 
It should be noted that `squash` changes the contents of `dunstrc`, which may cause syntax errors
if colors are not sourced correctly. Use at your own risk. 

### neovim

If you are using `neovim`, `squash` will be able to reload all open instances of `nvim` assuming that you
have `nvr-remote` installed and always open `nvim` as a server. To open as a server, add the following
function to your `.zshrc` or equivalent: 

```sh
nvim() {
    local fn="$(mktemp -u "/tmp/nvimsocket-XXXXXXX")"
    NVIM_LISTEN_ADDRESS=$fn /usr/bin/nvim $@
}
```

`squash` will attempt to edit your `$MYVIMRC`, which may cause problems. Use at your own risk.
