#!/usr/bin/env bash

#!/bin/bash


# Get directory of squash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Create directory in .config
mkdir -p ~/.config/squash
mkdir -p ~/.config/squash/themes

# Move themes
cp -n $DIR/test_themes/* ~/.config/squash/themes/

# Create necessary openbox themes
mkdir -p ~/.local/share/themes/generic
mkdir -p ~/.local/share/themes/generic/openbox-3

# Create generic openbox theme w/ default font
cp -n $DIR/generic/themerc ~/.local/share/themes/generic/






