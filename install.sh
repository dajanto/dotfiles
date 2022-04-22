#!/bin/bash

# TODO Insert README commands here

echo Installing...

rsync -av --exclude='install.sh' --exclude='README.md' --exclude='.git' . ~/dftest

echo Finished!
