#!/bin/bash

case "$OSTYPE" in
  darwin*)
    echo "OSX detected. Installing..."
    cp .vimrc ~
    cp .zshrc ~
    mkdir -p ~/.config
    if [ -e ~/.config/nvim ] || [ -L ~/.config/nvim ]; then
      mv ~/.config/nvim ~/.config/nvim.backup.$(date +%s)
    fi
    cp -r .config/nvim ~/.config/
    echo "...finished!" ;;
  linux*)
    echo "Linux detected. Installing..."
    cp .vimrc ~
    cp .zshrc ~
    mkdir -p ~/.config
    if [ -e ~/.config/nvim ] || [ -L ~/.config/nvim ]; then
      mv ~/.config/nvim ~/.config/nvim.backup.$(date +%s)
    fi
    cp -r .config/nvim ~/.config/
    echo "...finished!" ;;
  *)
    echo "Please install manually for $OSTYPE" ;;
esac
