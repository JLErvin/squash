#!/bin/sh

# Create directories
mkdir -p ${HOME}/.config/squash
mkdir -p ${HOME}/.config/squash/themes

# Copy themes
cp -r themes/* ${HOME}/.config/squash/themes/
cp -r defaults ${HOME}/.config/squash/defaults

printf "To change squash behavor, edit defualts at ${HOME}/.config/squash/defaults\n"
printf "To use squash, add it to your path\n"
printf "To use included bars, add the squash bars to your path\n"
