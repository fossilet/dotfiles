# Custom bash aliases and functions
#
# Since circa 2009

OS=$(uname -s)  # Darwin or Linux

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias acs='apt-cache search'
alias acshow='apt-cache show'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias ags='sudo apt-get source'
alias ap='sudo aptitude'
alias d='dict'
alias g='git'
alias mysql='mysql --sigint-ignore'
alias n='nautilus'
alias no='ls'

if [[ $OS = 'Darwin' ]]; then
    alias o='open'
else
    alias o='xdg-open'
fi

alias sudo='sudo '

# alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

if [[ $(uname -s) = "Darwin" ]]; then
    alias ls='ls -G'
    true
else
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

alias smth='mylogin smth'

# Show diff of a specific commit
gitlog () {
    git log --stat "$1^".."$1";
}

###
# From rex zhang
###
alias a="alias"
alias curl='curl -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.57 Safari/537.1"'

# Use \command to ignore alias
alias df='df -h'
#alias ping="ping -c 5"

# Python related
alias py="python"
alias ipy="ipython"
alias bpy="bpython"
alias py3="python3"
#alias pmr="python manage.py runserver 0.0.0.0:8000"
#alias pm="python manage.py"
#alias pms="python manage.py shell"
#alias pmsyn="python manage.py syncdb"
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

# Go to directories
alias djsrc='cd /usr/local/lib/python2.7/dist-packages/django'

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
