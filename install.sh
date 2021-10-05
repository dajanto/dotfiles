#!/bin/bash

printf "\n"
echo Installing...

config="~/.config/"

printf "\n"

if test -d ${config}i3/; 
  then cp .config/i3/config ${config}i3/; 
  else mkdir -p ${config}i3/; cp .config/i3/config ${config}i3/; fi
echo "i3 [x]";

if test -d ${config}zathura/; 
  then cp .config/zathura/zathurarc ${config}zathura/; 
  else mkdir -p ${config}zathura; cp .config/zathura/zathurarc ${config}zathura/; fi
echo "zathura [x]";

if test -d ${config}i3status/; 
  then cp .config/i3status/config ${config}i3status/;
  else mkdir -p ${config}i3status/; cp .config/i3status/config ${config}i3status/; fi
echo "i3status [x]";

if test -d ${config}picom/
  then cp .config/picom/picom.conf ${config}/picom/;
  else mkdir -p ${config}picom; cp .config/picom/picom.conf ${config}picom/; fi
echo "picom [x]";

cp .vimrc ~
echo ".vimrc [x]";
cp .bashrc ~
echo ".bashrc [x]";
cp .xprofile ~
echo ".xprofile [x]";
cp .imwheelrc ~
echo ".imwheelrc [x]";
cp .Xresources ~
echo ".Xresources [x]";

printf "\n"
echo Finished
printf "\n"
