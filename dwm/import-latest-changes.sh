#!/bin/bash

if [ ! -f dwm-mods.patch ]; then
	echo "Patch not found, aborting"
	exit
fi

if [ ! -d ~/git/dwm ]; then
	git clone git://git.suckless.org/dwm ~/git/dwm
fi

cp -f dwm-mods.patch ~/git/dwm
cd ~/git/dwm
git apply dwm-mods.patch

