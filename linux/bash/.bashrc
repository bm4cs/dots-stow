# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export GOROOT=/usr/local/go
export GOPATH=~/code/go
export PATH=$PATH:$GOROOT/bin:/usr/local/tools/gradle-2.3/bin

alias pbcopy='xel --clipboard --input'
alias pbpaste='xel --clipboard --output'

export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\u@\h \W]\\$ \[$(tput sgr0)\]"

#export $TERM=linux #fix for BitchX � characters

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ben/.sdkman"
[[ -s "/home/ben/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ben/.sdkman/bin/sdkman-init.sh"
