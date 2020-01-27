#!/bin/bash

# thx to hexdsl for sharing his config and ideas
# https://hexdsl.co.uk/hextool

me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
u="$USER"

menu()
{
	echo "usage:   " $me "[OPTION]"
	echo " "
	echo "init:    Install the basics (git/yay)"
	echo "dots:    Get Dots from gitlab (into '~/dots' folder)"
	echo "stow:    Restore Stow form dots"
	echo "apps:    Use 'yay' to install all Hex's applications"
	echo "syms:    THIS WILL DELETE FOLDERS YOU ARE USING! (uses nextcloud!)"
	echo "dwm:     Pulls down Hex's DWM repo (uses branches)"
	echo "webs:    Pulls down Hex's websites from git (You don't need this)"
	echo "wire:    Install Hex's Wireguard settings, only run if you is Hex"
	echo "hug:     We all need one sometimes"
	echo " "
	echo "...or just use option 'all' to just do it all in one go (DO NOT USE!) "
	echo " "
	echo "INFORMATION! - options are shown in 'best' order for new install."
}

init()
{
	cd /tmp/
	curl -LO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
	tar xvzf yay.tar.gz
	cd yay
	makepkg -sci
	sudo pacman -S --needed git
}

dwm()
{
	cd ~
	rm -r dwm
	git clone git://git.suckless.org/dwm
	cd dwm
	curl -LO https://dwm.suckless.org/patches/center/dwm-center-6.1.diff:
}

dots()
{
	cd ~
	git clone git@github.com:bm4cs/dots.git
}

stow()
{
	cd ~/dotfiles/stow-home
	for d in *; do stow -t ~ $d ;done
	
	#Setup ROOT stow files
	#cd ~/dots/stow_root; for d in *; do sudo stow -t / $d; done
}


