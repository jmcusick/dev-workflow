#!/bin/bash

### Set the prompt like "username@hostname:~ $"
# See: http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/
# And: http://mywiki.wooledge.org/BashFAQ/037
# 'tput bold' will work regardless of the foreground and background colors.
# Place the tput output into variables, so they are only execd once.
# \[ and \] are escape characters, \u is user, \h is host, \w is working directory

# bold=$(tput bold)
# reset=$(tput sgr0)
# green=$(tput setaf 2)
# export PS1="\[$green\]\u@\[$bold\]\h\[$reset\] : \w\n\$ "
# export PS1="\e[0;31m\[$green\]\u@\[$bold\]\h\[$reset\] : \w\n\$ "
# CAN SEE ALL RED IN EMACS

# Cannot use tput for prompt in emacs. Must use ANSI C quoting to directly insert escape sequences instead of using a escape-led string and letting the shell expand later. More info here: https://stackoverflow.com/questions/30651293/referencing-ansi-escape-sequences-in-environment-variables-within-awk

reset="\[\e[0m\]"
bold="\[\e[1m\]"
green="\[\e[32m\]"
magenta="\[\e[35m\]"
cyan="\[\e[36m\]"
smiley () {
    if [ $? -eq 0 ]; then
        echo ":D";
    else
        echo "D:";
    fi
}
git_prompt() {
    __git_ps1 " (%s)"
}
# export PS1="$green\u@$bold\h$reset \$(smiley) \w\n\$ "
export PS1="$cyan\t$reset \$(smiley) \w$magenta \$(git_prompt)\n$green\u$reset@$green$bold\h$reset\$ "