#!/bin/bash

# The [[ ! -L ]] condition checks for an existing symlink.
# On a fresh machine, these are actual files, so replace them.
# If they are already symlinks, don't touch them.
replace_file_with_symlink() {

  gitpath=~/git
  scriptspath="$gitpath/scripts"
  srcfile=$1
  destfile=$2

  if [[ ! -n $destfile ]]; then echo "no arg1: target file"; return 1; fi
  if [[ ! -n $srcfile ]]; then echo "no arg2: source file"; return 2; fi
  if [[ ! -d ~/git/scripts ]]; then
    echo "$scriptpath doesn't exist, attempt to clone git repo..."
    if ! mkdir -p $gitpath && git clone git@github.com:bm4cs/scripts.git $gitpath; then
      echo "failed to clone git repo, aborting";
      return 3; 
    fi
  fi

  if [[ ! -L $destfile ]]; then
    echo "linking $destfile to $srcfile"

    if [[ -e $destfile ]]; then
      rm $destfile
    fi 

    ln -nfs $srcfile $destfile
  else
    echo "$destfile already exists and is a symlink, nothing to do"
  fi
}


if [[ ! -d "~/.config/nvim" ]]; then mkdir -p ~/.config/nvim; fi
if [[ ! -d "~/.local/share/nvim/site" ]]; then mkdir -p ~/.local/share/nvim/site; fi
if [[ ! -d "~/.oh-my-zsh" ]]; then sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; fi

replace_file_with_symlink ~/git/scripts/linux/vim/vimrc ~/.vimrc 
replace_file_with_symlink ~/git/scripts/linux/vim ~/.vim
replace_file_with_symlink ~/git/scripts/linux/neovim/init.vim ~/.config/nvim/init.vim
replace_file_with_symlink ~/git/scripts/linux/vim/autoload ~/.local/share/nvim/site/autoload
replace_file_with_symlink ~/git/scripts/linux/git/gitconfig ~/.gitconfig
replace_file_with_symlink ~/git/scripts/linux/bash/bashrc ~/.bashrc
replace_file_with_symlink ~/git/scripts/linux/bash/profile ~/.profile
replace_file_with_symlink ~/git/scripts/linux/bash/aliases ~/.bash_aliases
replace_file_with_symlink ~/git/scripts/linux/mutt/.muttrc ~/.muttrc
replace_file_with_symlink ~/git/scripts/linux/mutt/.mutt ~/.mutt
replace_file_with_symlink ~/git/scripts/linux/zsh/.zshrc ~/.zshrc

# zsh custom
if [[ ! -f ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme ]]; then
  curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme --output ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

