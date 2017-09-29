# squash

squash is a theme manager for unix systems.
It is desinged to manage and apply user-created themes on a variety of window managers and applications.
squash is not intended to be an automatic themer like `wal` -
instead it is desinged to save and quickly apply user-created themes.

![Screenshot](https://i.imgur.com/ABX69pR.jpg)

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

Inside the `themes` direcotry you will find some colorschemes created by `crayolo`. You can add as many themes as you want here. I have also added some of my favorite themes such as
`solarized light` `solarized dark` and `oceanic next`.


To use with terminals such as rxvt-unicode, add the following to your .Xresources:


### Xresources

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

``` bash
source "/home/jlervin/.cache/squash/colors.sh"

loop() {
	while :; do
		echo "%{l}%{A1:popup.sh "term" "ncmpcpp" "60x20+760+40" &:}%{A3:mpc toggle &:}$a0$p$(desktops)$p$a1$(window)$bg%\
		{c}$p$(clock)$p%\
		{r}$a2$p$(network)$p$a1$p$(sound)$p$a0$p$(battery)$p$bg"
		sleep ".2s"
	done |\

	lemonbar \
			-f '-uw-ttyp0-medium-r-normal-*-12-*-*-*-*-*-*-*' \
	    -f '-wuncon-siji-medium-r-normal--10-100-75-75-c-80-iso10646-1' \
	    -g "x30" \
	    | bash
}

loop "$@"
```

### Openbox

```
```

### Polybar

```
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

```
set -g status-left '#[fg=colour15,bg=colour0] #S:#I #[fg=default,bg=default] '
```

As you can see, both URXVT and rofi will read from this file and create colorschemes accordingly.

As of right now, `bspwm` and `openbox` are supported by `squash`. `bspwm` is supported without any additional setup.

If you are using openbox, you will need to add an openbox configuration directory at
`~/.local/share/themes/generic/openbox-3/themerc`






