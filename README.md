<div align='center'>
    <h1>squash</h1><br>
</div>

`squash` is a dead simple theme manager for unix systems.
Themes are defined in pure shell scripts, allowing for squash to be both flexible and increadibly simple. 
`squash` takes theme information, applies it to active applications,
and writes files in various formats to be used by other programs. 

<img src="https://imgur.com/zmk2y1m.gif" alt="gif" align="center" width="500px">

Predefined themes are available in the `themes` directory. 
Add your own themes using the `template` file.
When you are ready, change themes with: 

```
squash <THEME>
```


## Getting Started

`squash` consists of two main files: `squash` and `pepper`. 
`squash` is a standalone theme engine that can apply user-created
themes to various system applications and write files in formats such
as bash and css for clients to use. `pepper` is a modular version of `squash`, 
which utilizes the various utility files in this repository to achieve the same results.

`squash` was designed with the unix philopsphy in mind - do one thing and do it well. 
Each script in this directory does one main function, such as reloading terminals
or neovim. You are free to use, expand, and edit these scripts as you see fit. 
This modular approach was largely inspired by `wmutils` - you are free to create your
own themeing engine using these scripts. 


## Usage

Clone the repository and make all script executable. 

```bash
git clone https://github.com/JLErvin/squash
chmod +x squash/*
```

Now, edit the `defaults` file and set the default behavior that you want. 
This includes setting what programs `squash` will attempt to reload. 

Next, create a directory for the theme files and copy them there. 

```bash
mkdir ~/.config/squash
cp -r ~/squash/themes/* ~/.config/squash/
```

You are now ready to change to your first theme: 

```bash
squash <THEME>
pepper <THEME>
```

## Configuration

`squash` is designed to work well with `X` systems and certain window managers. 
If you are using an x-based terminal, such as `urxvt`, you can make colors
persist on new terminals by adding the following to your `~/.Xresources`

```xdefaults
#include ".cache/squash/x_colors"
```
