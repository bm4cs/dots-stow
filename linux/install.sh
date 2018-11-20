#!/bin/bash

# The [[ ! -L ]] condition checks for an existing symlink.
# On a fresh machine, these are actual files, so replace them.
# If they are already symlinks, don't touch them.
replace_file_with_symlink() {
  if [[ ! -n $1 ]]; then echo "no arg1: target file"; return 1; fi
  if [[ ! -n $2 ]]; then echo "no arg2: source file"; return 2; fi
  if [[ ! -e ~/git/scripts ]]; then echo "~/git/scripts doesn't exist"; return 3; fi

  if [[ ! -L $1 ]]; then
    echo "linking $1 to $2"
    rm $1
    ln -nfs $2 $1
  else
    echo "$1 already exists and is a symlink, nothing to do"
  fi
}


replace_file_with_symlink ~/.vimrc ~/git/scripts/linux/vim/vimrc
replace_file_with_symlink ~/.gitconfig ~/git/scripts/linux/git/gitconfig
replace_file_with_symlink ~/.bashrc ~/git/scripts/linux/bash/bashrc
replace_file_with_symlink ~/.bash_aliases ~/git/scripts/linux/bash/aliases
replace_file_with_symlink ~/.muttrc ~/git/scripts/linux/mutt/.muttrc
replace_file_with_symlink ~/.mutt ~/git/scripts/linux/mutt/.mutt

