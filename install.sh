#!/bin/bash

# Author: bm4cs
# Purpose: To symlink in the `dotfiles` repo.
#          Run as `./install.sh override` or `./install.sh`
#          Optional `override` will replace existing symlinks


# for coloring messages
# echo "${red}red text ${green}green text${reset}"
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
reset=`tput sgr0`


# override mode will nuke existing symlinks
override=false
if [[ $1 = 'override' ]]; then
  override=true
fi


# The [[ ! -L ]] condition checks for an existing symlink.
# On a fresh machine, these are actual files, so replace them.
# If they are already symlinks, don't touch them.
replace_file_with_symlink() {

  if [[ -z $1 ]]; then
    echo '    ${red}missing srcfile param, aborting${reset}'
    return 1;
  fi

  if [[ -z $2 ]]; then
    echo '    ${red}missing destfile param, aborting${reset}'
    return 2;
  fi

  srcfile=$1
  destfile=$2

  if [[ ! -n $destfile ]]; then echo "    ${red}no arg1: target file${reset}"; return 1; fi
  if [[ ! -n $srcfile ]]; then echo "    ${red}no arg2: source file${reset}"; return 2; fi
  if [[ ! -d ~/dotfiles ]]; then
    echo "    dotfiles repo doesn't exist, attempt to clone it..."
    if ! git clone git@github.com:bm4cs/dotfiles.git ~; then
      echo "    ${red}failed to clone git repo, aborting${reset}";
      return 3; 
    fi
  fi

  if [[ ! -L $destfile || $override = true ]]; then
    echo "    linking $destfile to $srcfile"

    if [[ -e $destfile ]]; then
      rm -rf $destfile
    fi 

    ln -nfs $srcfile $destfile
  else
    echo "    $destfile already exists and is a symlink, nothing to do"
  fi
}


if [[ ! -d "~/.config/nvim" ]]; then mkdir -p ~/.config/nvim; fi
if [[ ! -d "~/.local/share/nvim/site" ]]; then mkdir -p ~/.local/share/nvim/site; fi
if [[ ! -d "~/.oh-my-zsh" ]]; then sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; fi


echo "${cyan}setting up vim${reset}"
replace_file_with_symlink ~/dotfiles/vim/vimrc ~/.vimrc 
replace_file_with_symlink ~/dotfiles/vim ~/.vim
replace_file_with_symlink ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
replace_file_with_symlink ~/dotfiles/vim/autoload ~/.local/share/nvim/site/autoload
# ycm needs vim python integration, install this with `pip install neovim`
echo "${green}done${reset}"


echo "${cyan}setting up git${reset}"
replace_file_with_symlink ~/dotfiles/git/gitconfig ~/.gitconfig
echo "${green}done${reset}"


echo "${cyan}setting up shells (bash and zsh)${reset}"
replace_file_with_symlink ~/dotfiles/bash/bashrc ~/.bashrc
replace_file_with_symlink ~/dotfiles/bash/profile ~/.profile
replace_file_with_symlink ~/dotfiles/bash/aliases ~/.bash_aliases
replace_file_with_symlink ~/dotfiles/zsh/.zshrc ~/.zshrc
#chsh -s $(which zsh)
echo "${green}done${reset}"


echo "${cyan}setting up mutt${reset}"
replace_file_with_symlink ~/dotfiles/mutt/.muttrc ~/.muttrc
replace_file_with_symlink ~/dotfiles/mutt/.mutt ~/.mutt
echo "${green}done${reset}"


echo "${cyan}setting up xwindows${reset}"
replace_file_with_symlink ~/dotfiles/x/xinitrc ~/.xinitrc
replace_file_with_symlink ~/dotfiles/x/Xresources ~/.Xresources
echo "${green}done${reset}"


echo "${cyan}setting up i3wm${reset}"
replace_file_with_symlink ~/dotfiles/i3 ~/.config/i3
replace_file_with_symlink ~/dotfiles/i3status ~/.config/i3status
echo "${green}done${reset}"


echo "${cyan}setting up gtk rice${reset}"
replace_file_with_symlink ~/dotfiles/gtk/gtkrc-2.0 ~/.gtkrc-2.0
replace_file_with_symlink ~/dotfiles/gtk/themes ~/.themes
replace_file_with_symlink ~/dotfiles/gtk/icons ~/.icons
echo "${green}done${reset}"


echo "${cyan}setting up qt rice${reset}"
replace_file_with_symlink ~/dotfiles/qt5ct ~/.config/qt5ct
replace_file_with_symlink ~/dotfiles/fontconfig ~/.config/fontconfig
echo "${green}done${reset}"


echo "${cyan}setting up mpd${reset}"
replace_file_with_symlink ~/dotfiles/mpd ~/.config/mpd
replace_file_with_symlink ~/dotfiles/ncmpcpp ~/.config/ncmpcpp
echo "${green}done${reset}"


# zsh custom
if [[ ! -f ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme ]]; then
  curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme --output ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi


# fonts
echo "rebuilding ${magenta}font cache${reset}"
replace_file_with_symlink ~/dotfiles/fonts ~/.fonts
fc-cache -vr
# `pacman -S powerline-fonts`
echo "${green}done${reset}"


# setup handy scripts in ~/bin, this is PATHed by .profile
echo "setting up ${magenta}handy scripts${reset}"
if [[ ! -d "~/bin" ]]; then mkdir -p ~/bin; fi
replace_file_with_symlink ~/dotfiles/scripts/maimpick ~/bin/maimpick
echo "${green}done${reset}"

