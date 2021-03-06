# Custom bash aliases and functions
#
# Since circa 2009

OS=$(uname -s)  # Darwin or Linux

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# This will ensure that Vim in Homebrew is invoked rather than the
# less featureful Vi in OS X.
alias vi='\vim'

alias git='hub'
alias mysql='mysql --sigint-ignore'
alias n='nautilus'
alias ag='rg -L'
alias sed='gsed'

if [[ $OS = 'Darwin' ]]; then
    alias o='open'
    alias sha256sum='shasum -a256'
    alias md5sum='md5'
    alias ls='/usr/local/bin/gls --color=auto'
else  # Linux
    alias o='xdg-open'
    alias acs='apt-cache search'
    alias acshow='apt-cache show'
    alias agi='sudo apt-get install'
    alias agr='sudo apt-get remove'
    alias ags='sudo apt-get source'
    alias ap='sudo aptitude'
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
    # alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"
fi

alias sudo='sudo '
alias diff='diff -u'


alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -t'

###
# From rex zhang
###
alias curl='curl -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.57 Safari/537.1"'

# Use \command to ignore alias
alias df='df -h'
#alias ping="ping -c 5"

alias pyc="find . -name '*.pyc' "
alias pycd='pyc -delete'

# Misc
# We already have tree
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias count="sort | uniq -c| sort -nr"

#alias star="tmux attach-session -t rex || tmux new-session -s rex"

#charset convert
alias g2u="iconv -f gbk -t utf-8"
alias b2u="iconv -f big5 -t utf-8"
alias u2g='iconv -f utf-8 -t gbk'

# converter, math
alias sec="date \"+%s\""
alias now='date "+%Y-%m-%d %H:%M"'

# cases
alias upper='tr /a-z/ /A-Z/'
alias lower='tr /A-Z/ /a-z/'

# htop is better than top
alias top='htop'
alias grep='ack-grep'

# https://github.com/github/hub
#alias git='hub'

# Common typo to tolerate
alias sl='ls'

# For OSX
#alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Reomve /usr/local/bin from PATH, use only Apple shipped Python.
alias jhbuild="export PATH=/Users/tux/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin; ~/.local/bin/jhbuild"

alias st='stree'
# Toggle automatic margins (line wrapping)
alias wrapon='tput smam'
alias wrapoff='tput rmam'

alias kc=kubectl


# Functions
mycd () {
    if [ -a "$1" ] && [ ! -d "$1" ]; then
        builtin cd "$(dirname "$(realpath "$1")")"
    elif [ -z "$1" ]; then
        builtin cd
    else
        builtin cd "$*"
    fi
}
alias cd='mycd'

myldapsearch() {
    /usr/bin/ldapsearch "$*" | perl -MMIME::Base64 -n -00 -e \
        's/\n +//g;s/(?<=:: )(\S+)/decode_base64($1)/eg;print'
}
alias ldapsearch=myldapsearch
