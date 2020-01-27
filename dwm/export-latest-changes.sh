#!/bin/bash

echo "Creating patch from ~/git/dwm"
orig_dir=$PWD
cd ~/git/dwm
git diff > dwm-mods.patch
cp dwm-mods.patch $orig_dir
echo "Done"

