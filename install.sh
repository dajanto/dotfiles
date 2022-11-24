#!/bin/bash

case "$OSTYPE" in
  darwin*)
    echo "OSX detected. Installing..."
    cp .vimrc ~
    cp osx/.bash_profile ~ ;;
  linux*)
    echo "Linux detected. Installing..."
    cp .vimrc ~
    cp .bashrc ~ ;;
  *)
    echo "Please install manually for $OSTYPE" ;;
esac