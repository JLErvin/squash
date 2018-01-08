# squash

squash is a theme manager for unix systems.
It is desinged to manage and apply user-created themes on a variety of window managers and applications.
squash is not intended to be an automatic themer like `wal` -
instead it is desinged to save and quickly apply user-created themes.

![gif](https://thumbs.gfycat.com/WeepyRemarkableAdeliepenguin-size_restricted.gif)

## Rationale

There are a lot of theme managers available right now - many of them more developed and feature-rich than squash. 
Programs like `wal`, `pywal`, and `zenbu` come to mind when thinking of themeing software. 
I developed `squash` to be a simple alternative to these programs that uses a bash script
for configuration - making `squash` very extendable and intutitive. 

For example, a typical `squash` theme file looks like this:

``` bash
#!/bin/bash
bg=#3c4254
fg=#feddd0
....
wallpaper=$HOME/wallpapers/wallpaper.png
```

This kind of file can easily be modified to add new and complex functionality. For example,
if you wanted your theme to use certain colors for `lemonbar`, you could create new varaiables
in this one location and modify squash to write a `lemonbar` color file. Sourcing this way is intuitive and simple, and makes `squash` very extendable. 

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
