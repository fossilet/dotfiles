# For OSX

# This should only be for login shells, but Terminal.app and iTerm do source
# this; PyCharm does not.

# Since Mer  5 fév 2014 06:05:49 CST

brew_path=$(which brew)
if [[ -x $brew_path ]]; then
    export brew_installed=true
else
    export brew_installed=false
fi

# Brew takes precedence.
export PATH=/usr/local/sbin:$PATH

 if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
   . $(brew --prefix)/share/bash-completion/bash_completion
 fi

# This file is only sourced for login shell, and on OSX the terminal opens a
# login shell by default. Thus we need to source .bashrc here.
if [[ -r ~/.bashrc ]]; then
    . ~/.bashrc
fi
