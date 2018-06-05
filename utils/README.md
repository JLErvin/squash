<div align='center'>
    <h1>squash utils</h1><br>
</div>

This is a sub-repository that aims to make `squash` tools available to users who want a more custom experience.
Instead of all functions being enclosed in a single file, functions are seperated into seperate scripts.
End users are free to use them how they want. 

`squash utils` are for advanced users only.
If you want a more vanilla and hands-free experience, I highly reccomend using the `squash` script.

The following scripts are included: 

* `pepper`: A clone of squash that uses seperate scripts
* `reload_2bwm`: Updates `2bwm` colors and recompiles the program.
* `reload_bspwm`: reloads `bspwm`
* `reload_wchef`: reloads `windowchef`
* `reload_wm`: identifies the current window manager and reloads it
* `reload_bar`: Kills and reloads the current bar (`lemonbar` or `polybar`) 
* `reload_dunst`: changes the default fg/bg colors in `dunst` and restarts the application
* `reload_nvim`: reloads all open instances of `nvim` - requires `nvr-remote`
* `reload_wallpaper`: reloads the current wallpaper
