#!/bin/bash

echo "symlinking .vim"

ln -nfs ~/git/scripts/linux/vim/vimrc ~/.vimrc
ln -nfs ~/git/scripts/linux/vim ~/.vim
#ln -nfs ~/git/scripts/linux/bash/bashrc ~/.bashrc
#ln -nfs ~/git/scripts/linux/bash/aliases ~/.bash_aliases

#vim plugins to checkout; DelimitMate, NERDCommenter, Fugitive (git), Tagbar, Surround
#mirnazim.org/writings/vim-plugins-i-use/

#To add submodules for Pathogen:
# git submodule add git://github.com/foo/tagbar.git bundles/tagbar
# git submodule init && git submodule update

