#!/bin/bash

if [ ! -f st-mods.patch ]; then
	echo "Patch not found, aborting"
	exit
fi

if [ ! -d ~/git/st ]; then
	git clone git://git.suckless.org/st ~/git/st
fi

cp -f st-mods.patch ~/git/st
cd ~/git/st
git apply st-mods.patch

