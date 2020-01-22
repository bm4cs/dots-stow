#!/bin/bash

# thx to hexdsl for sharing his config and ideas
# https://hexdsl.co.uk/hextool

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
	git clone git@github.com:bm4cs/dotfiles.git
}

stow()
{
#Remove old MimeTypes list (Because X11 puts it back all the time!)
#rm ~/.config/mimeapps.list

#setup ~ stow files
#rm ~/.config/mimeapps.list &
cd ~/dots/stow_home
for d in *; do stow -t ~ $d ;done


#Setup ROOT stow files
#cd ~/dots/stow_root; for d in *; do sudo stow -t / $d; done
}
