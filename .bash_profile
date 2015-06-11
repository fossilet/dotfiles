# For OSX

# Since Mer  5 fév 2014 06:05:49 CST

# https://superuser.com/q/267771
# Put first to ensure the signal handler is set up before sending the signal.
brew_path=$(which brew)
[[ -x $brew_path ]] && trap 'source $(brew --prefix)/etc/bash_completion; trap USR1' USR1

# Brew takes precedence.
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Suggested by brew info bash-completion, but is slow for bash-completion
# version 1. For version 2, the delay is innoticeable.
# if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
#   . $(brew --prefix)/share/bash-completion/bash_completion
# fi

# This file is only sourced for login shell, and on OSX the terminal opens a
# login shell by default. Thus we need to source .bashrc here.
if [[ -r ~/.bashrc ]]; then
    . ~/.bashrc
fi

[ -x $brew_path ] && builtin kill -USR1 $$ & disown
