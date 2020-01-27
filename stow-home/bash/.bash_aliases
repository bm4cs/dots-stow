#!/bin/sh

alias ka="killall"
alias mkd="mkdir -pv"
alias calcurse="calcurse -D ~/.config/calcurse"
alias p="sudo pacman"
alias s="sudo systemctl"
alias f="$FILE"
alias g="git"
alias e="$EDITOR"
alias v="$EDITOR"
alias x="sxiv -ft *"
alias ls="ls -hN --color=auto --group-directories-first"
alias ll="ls -lah"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias rank='sudo reflector --verbose -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist'
alias yt="youtube-dl --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias yta="yt -x -f bestaudio/best"
alias vim="nvim"
alias vimdiff="nvim -d"

