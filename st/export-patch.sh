#!/bin/bash

echo "Creating patch from ~/git/st"
orig_dir=$PWD
cd ~/git/st
git diff > st-mods.patch
cp st-mods.patch $orig_dir
echo "Done"

