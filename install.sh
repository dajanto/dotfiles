#!/bin/bash

case "$OSTYPE" in
  darwin*)
    echo "OSX detected. Installing..."
    cp .vimrc ~
    cp osx/.bash_profile ~
    echo "...finished!" ;;
  linux*)
    echo "Linux detected. Installing..."
    cp .vimrc ~
    cp .bashrc ~
    echo "...finished!" ;;
  *)
    echo "Please install manually for $OSTYPE" ;;
esac