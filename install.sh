#!/bin/bash

case "$OSTYPE" in
  darwin*)
    echo "OSX detected. Installing..."
    cp .vimrc ~
    cp osx/.bash_profile ~
    cp .zshrc ~
    mkdir -p ~/.config/nvim/
    cp .config/nvim/* ~/.config/nvim
    echo "...finished!" ;;
  linux*)
    echo "Linux detected. Installing..."
    cp .vimrc ~
    cp .bashrc ~
    cp .zshrc ~
    mkdir -p ~/.config/nvim/
    cp .config/nvim/* ~/.config/nvim
    echo "...finished!" ;;
  *)
    echo "Please install manually for $OSTYPE" ;;
esac
