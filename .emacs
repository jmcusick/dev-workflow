alias emacs='emacs -nw'
alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
alias db='comdb2sc.tsk'

export swingHome='/home/jcusick12/swing/swingtools'
alias r='swing run'
alias m='swing make'
alias mc='swing make -c'
alias mr='swing make && swing run'
alias mcr='swing make -c && swing run'
alias basgen='swing basgen'
alias basp='swing basp'
alias basrun='swing basrun'
alias pwin='/bb/bin/getprdwin -u op1 -d "console windows"'
alias pwinextreme='multi-op1 -l tiled'

alias ddd='dpkg-distro-dev'

alias gnome='gnome-terminal'

export mbig='/bb/mbig/mbig6672'
export EDITOR='emacs -nw'

# Fix locale errors when using mkdocs on reg.bbgithub.dev.bloomberg.com
export LANG=en_US.utf8

if [ "$(uname -s)" == "Linux" ]; then
    . ~/.git-completion.bash
fi