# squash

A dead simple program to apply user-created themes to unix systems. 

Unlike many themeing programs, squash uses bash scripts for configuration. 
This makes squash very extensible, and allows all information about a theme
to be store in a single bash file. 

The most basic `squash` theme files look like:


``` zsh
#!/bin/bash
bg=#3c4254
fg=#feddd0

blk=#181818
red=#ab4642
grn=#a1b56c
ylw=#f7ca88
blu=#7cafc2
mag=#ba8baf
cyn=#86c1b9
wht=#d8d8d8

bblk=#585858
bred=#dc9656
bgrn=#282828
bylw=#383838
bblu=#b8b8b8
bmag=#e8e8e8
bcyn=#a16946
bwht=#f8f8f8
```

This defines all the colors that the system is going to use, and can easily apply them to .Xresources
to reflect these colors on all current and new terminals. 

However, by using bash files, we can easily extend squash to add new functionality. For example, 
we can specify a `wallpaper` variable that will applied uniquely to each theme. 

``` zsh
#!/bin/bash
bg=#3c4254
fg=#feddd0

blk=#181818
...
...
wallpaper=~/Wallpapers/wallpaper.png
```

Or, we could specify what colorscheme we want vim to use with each colorscheme: 
``` bash
#!/bin/bash
bg=#3c4254
fg=#feddd0

blk=#181818
...
...
wallpaper=~/Wallpapers/wallpaper.png
vim_scheme=base16-default-dark
```

Squash currently includes the following features: 
   * Apply colors to existing urxvt terminals
   * Create color files using the following formats:
      * bash
      * css
      * Xresources
         * 2bwm colors
         * rofi colors
         * urxvt colors
   * Reload and recompile 2bwm after applying new colors
   * Reload lemonbar after applying new colors
   * Rewrite $MYVIMRC to use desired colorscheme

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
