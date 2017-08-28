# squash

squash is a theme manager for unix systems. 
It is desinged to manage and apply user-created themes on a variety of window managers and applications.
squash is not intended to be an automatic themer like `wal` - 
instead it is desinged to save and quickly apply user-created themes. 

![Screenshot](http://i.imgur.com/GULkGbv.jpg)

## Install 

`squash` can be installed using the following commands:

```
git clone https://github.com/JLErvin/squash
cd squash
./install
```

For ease of use, add squash to your path. That will most likely look like this in your bashrc:

`PATH=~/squsah:$PATH'

Finally, make `squash` executable:

`chmod +x squash`

## Usage

`squash <THEME>`

Assuming the install worked correctly, you should now have a `squash` folder in your .config directory
Inside this directory there will be three sub-directories `config`, `generic`, and `themes`. 
Do not modify the `generic` directory, as the program will stop working.

Inside the `themes` direcotry you will find some colorschemes created by `crayolo`. You can add as many themes as you want here. 
These files are used to determine the colors of your system. 

Inside the `config` directory you will find a configuration file for every colorscheme. 
These config files are there for the user to customize each colorscheme they use. 
For example, some colorschemes may lend themeselves well to use red as a background 
and green as an accent - others not so much. You can specify what colors you want as 
background, foreground, and accent here. In addition, you can specifiy a path to your desired
wallpaper for this colorscheme. 

To use with terminals such as rxvt-unicode, add the following to your .Xresources:

```
#include </home/YOURUSERNAME/.config/squash/generic/colors>

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
```

As you can see, both URXVT and rofi will read from this file and create colorschemes accordingly.

As of right now, `bspwm` and `openbox` are supported by `squash`. `bspwm` is supported without any additional setup.

If you are using openbox, you will need to add an openbox configuration directory at 
`~/.local/share/themes/generic/openbox-3/themerc`






