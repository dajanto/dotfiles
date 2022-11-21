#!/bin/bash

echo Installing...

# TODO osx vs linux vs windows installation
rsync -av --exclude='install.sh' --exclude='README.md' --exclude='.git' --exclude='windows10' . ~

echo ...finished!
