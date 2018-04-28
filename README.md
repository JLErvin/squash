<div align='center'>
    <h1>squash</h1><br>
</div>

`squash` is a collection of scripts and configuration files
to emulate desktop environment-features with minimal window
managers such as `2bwm`, `bspwm`, and `openbox`.
`squash` is based around configuration files written in 
pure bash. 
The main script, `squash`, is able to apply these themes to terminals, 
bars, notifications, and write files in additional formats to be used
by applicatons like `xorg`, `firefox`, and more. 

## Theory

Managing themes on unix systems can often be difficult. 
Nearly even program stores their theme files in different locations
and in different formats. 
Squash aims to consolidate theme information into a single location. 
These files can then be used to quickly apply themes to the entire system.

## Installation

Installing and setting up squash should be fairly simple. Follow these steps:

1) Clone the repository:
    `git clone https://github.com/JLErvin/squash`

2) Create the theme directory and move themes there
    ```bash
    cd squash
    mkdir ~/.config/squash
    cp themes/* ~/.config/squash
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
    
