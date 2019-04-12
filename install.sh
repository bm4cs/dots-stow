#!/bin/bash

# Author: bm4cs
# Purpose: To symlink in the `dotfiles` repo.
#          Run as `./install.sh override` or `./install.sh`
#          Optional `override` will replace existing symlinks

override=false

if [[ $1 = 'override' ]]; then
  override=true
fi


# The [[ ! -L ]] condition checks for an existing symlink.
# On a fresh machine, these are actual files, so replace them.
# If they are already symlinks, don't touch them.
replace_file_with_symlink() {

  if [[ -z $1 ]]; then
    echo 'missing srcfile param, aborting'
    return 1;
  fi

  if [[ -z $2 ]]; then
    echo 'missing destfile param, aborting'
    return 2;
  fi

  srcfile=$1
  destfile=$2

  if [[ ! -n $destfile ]]; then echo "no arg1: target file"; return 1; fi
  if [[ ! -n $srcfile ]]; then echo "no arg2: source file"; return 2; fi
  if [[ ! -d ~/dotfiles ]]; then
    echo "dotfiles repo doesn't exist, attempt to clone it..."
    if ! git clone git@github.com:bm4cs/dotfiles.git ~; then
      echo "failed to clone git repo, aborting";
      return 3; 
    fi
  fi

  if [[ ! -L $destfile || $override = true ]]; then
    echo "linking $destfile to $srcfile"

    if [[ -e $destfile ]]; then
      rm -rf $destfile
    fi 

    ln -nfs $srcfile $destfile
  else
    echo "$destfile already exists and is a symlink, nothing to do"
  fi
}


if [[ ! -d "~/.config/nvim" ]]; then mkdir -p ~/.config/nvim; fi
if [[ ! -d "~/.local/share/nvim/site" ]]; then mkdir -p ~/.local/share/nvim/site; fi
if [[ ! -d "~/.oh-my-zsh" ]]; then sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; fi

# vim
replace_file_with_symlink ~/dotfiles/vim/vimrc ~/.vimrc 
replace_file_with_symlink ~/dotfiles/vim ~/.vim
replace_file_with_symlink ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
replace_file_with_symlink ~/dotfiles/vim/autoload ~/.local/share/nvim/site/autoload
# ycm needs vim python integration, install this with `pip install neovim`



# git
replace_file_with_symlink ~/dotfiles/git/gitconfig ~/.gitconfig

# shells
replace_file_with_symlink ~/dotfiles/bash/bashrc ~/.bashrc
replace_file_with_symlink ~/dotfiles/bash/profile ~/.profile
replace_file_with_symlink ~/dotfiles/bash/aliases ~/.bash_aliases
replace_file_with_symlink ~/dotfiles/zsh/.zshrc ~/.zshrc
#chsh -s $(which zsh)

# mutt
replace_file_with_symlink ~/dotfiles/mutt/.muttrc ~/.muttrc
replace_file_with_symlink ~/dotfiles/mutt/.mutt ~/.mutt

# xwindows
replace_file_with_symlink ~/dotfiles/x/.xinitrc ~/.xinitrc
replace_file_with_symlink ~/dotfiles/x/.Xresources ~/.Xresources



# i3wm
replace_file_with_symlink ~/dotfiles/i3 ~/.config/i3
replace_file_with_symlink ~/dotfiles/i3status ~/.config/i3status



# mpd



# zsh custom
if [[ ! -f ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme ]]; then
  curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme --output ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi


# fonts
replace_file_with_symlink ~/dotfiles/fonts ~/.fonts
fc-cache -vr
# `pacman -S powerline-fonts`


