# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Custom lines
source ~/MEGA/dotfiles/.settings_priv

# ignore small typos in directory names in interactive cd command
shopt -s cdspell

# For prompt
git_branch () {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e 's/((/(/' -e 's/))/)/'
}
user_host='\[\033[01;32m\]\u@\h\[\033[00m\]:'
cwd='\[\033[01;34m\]\w\[\033[00m\]'
# Must use single quote here
gitbr='\[\033[01;35m\]$(git_branch)\[\033[00m\]'
bgjobs='(\j)'
exit_status='$(es=$?; if [ $es -ne 0 ]; then echo [$es]; fi)'
# XXX: exit_status must be put before $gitbr, otherwise $? is git's exit
# status
PS1="$user_host""$cwd""$bgjobs""$exit_status""$gitbr""\$ "


# Customization on Neverland

shopt -s histverify
#shopt -s nullglob
export PS_PERSONALITY=bsd


# Host-specific variables. Done in a subshell to make a,b,c local variables.
#a=(MY_HTTP_PORT MY_IF)
#b=(8080 eth0)
#c=(8000 wlan0)
#for i in $(seq ${#a[@]}); do
#    if [ $HOSTNAME = "Neverland" ]; then
#        export ${a[i-1]}=${b[i-1]}
#        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    elif [ $HOSTNAME = "dell" ]; then
#        export ${a[i-1]}=${c[i-1]}
#        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    else
#        exit 2
#    fi
#done
#unset a b c

# Override _pnames in /etc/bash_completion to use ps without BSD options
#_pnames()
#{
#    COMPREPLY=( $( compgen -X '<defunct>' -W '$( command ps -eo command= | \
#        sed -e "s/ .*//" -e "s:.*/::" -e "s/:$//" -e "s/^[[(-]//" \
#            -e "s/[])]$//" | sort -u )' -- "$cur" ) )
#}

# Color man pages
# export LESS_TERMCAP_mb=$'\E[01;31m'
# export LESS_TERMCAP_md=$'\E[01;37m'
# export LESS_TERMCAP_me=$'\E[0m'
# export LESS_TERMCAP_se=$'\E[0m'
# export LESS_TERMCAP_so=$'\E[01;44;33m'
# export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_us=$'\E[01;32m'

# Prompt command. Be sure to retain the original command. See /etc/bashrc on
# OSX.
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Completions

_mylogin() {
    local cur prev args
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    args="$(get_hostnames.py)"
    COMPREPLY=( "${COMPREPLY[@]}" $( compgen -W "${args}" -- "${cur}" ) )
}
#complete -F _mylogin mylogin

# Debian maintainer
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
complete -F _quilt_completion $_quilt_complete_opt dquilt

# Better less
# XXX: if we set PAGER here, less in IPython will mess ANSI colors.
# export PAGER='less -i'  # case-insensitive search

# Determine OS.
if [[ $(uname -s) = 'Darwin' ]]; then
    export OS='osx'
else
    export OS='linux'
fi

export GOPATH=/Users/tux/Downloads/code/goworkspace
export PATH="$HOME/bin:$HOME/bin/vault:$PATH:/usr/local/share/pypy:$GOPATH/bin"

# For GNU ls color. Verbatim output of dircolors on Ubuntu 12.04
eval "$(/usr/local/bin/gdircolors)"

export PYTHONSTARTUP=~/.pythonrc

export JAVA_HOME="$(/usr/libexec/java_home)"
export HOMEBREW_NO_AUTO_UPDATE=1
