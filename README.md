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

## Configuration Files

## Scripts
    * Base
        * `squash`: Central script to apply themes and write new color files from given theme
        * `sqbar` : A minimal block-style bar using `lemonbar` with patched borders
    * Notifications
        * `batnot`: Basic script to check battery levels and send notifications when battery is low
