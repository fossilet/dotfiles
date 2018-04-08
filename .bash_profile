# For OSX

# This should only be for login shells, but Terminal.app and iTerm do source
# this; PyCharm does not.

# Since Mer  5 fév 2014 06:05:49 CST

# Actually not used anywhere.
export brew_installed
brew_installed=$(test -x "$(which brew)")

# Brew takes precedence.
export PATH=/usr/local/sbin:$PATH

# FIXME: too slow: https://superuser.com/a/418112/79465

 if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
     . $(brew --prefix)/share/bash-completion/bash_completion
 fi

. ~/.minikube-completion


# This file is only sourced for login shell, and on OSX the terminal opens a
# login shell by default. Thus we need to source .bashrc here.
if [[ -r ~/.bashrc ]]; then
    . ~/.bashrc
fi
wait
