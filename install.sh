#!/bin/bash

printf "\n"

if test -d /home/dajanto/.config/i3/; 
  then cp .config/i3/config /home/dajanto/.config/i3/; 
  else mkdir -p /home/dajanto/.config/i3/; cp .config/i3/config /home/dajanto/.config/i3/; fi
echo "i3 [x]";

if test -d /home/dajanto/.config/zathura/; 
  then cp .config/zathura/zathurarc /home/dajanto/.config/zathura/; 
  else mkdir -p /home/dajanto/.config/zathura; cp .config/zathura/zathurarc /home/dajanto/.config/zathura/; fi
echo "zathura [x]";

if test -d /home/dajanto/.config/i3status/; 
  then cp .config/i3status/config /home/dajanto/.config/i3status/;
  else mkdir -p /home/dajanto/.config/i3status/; cp .config/i3status/config /home/dajanto/.config/i3status/; fi
echo "i3status [x]";

if test -d /home/dajanto/picom/
  then cp .config/picom/picom.conf /home/dajanto/.config/picom/;
  else mkdir -p /home/dajanto/.config/picom; cp .config/picom/picom.conf /home/dajanto/.config/picom/; fi
echo "picom [x]";

cp .vimrc /home/dajanto/
echo ".vimrc [x]";
cp .bashrc /home/dajanto/
echo ".bashrc [x]";
cp .xprofile /home/dajanto/
echo ".xprofile [x]";
cp .imwheelrc /home/dajanto/
echo ".imwheelrc [x]";

printf "\n"
echo Finished
