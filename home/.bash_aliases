alias tmux='tmux -2'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias hostip="ifconfig wlan0 | grep inet | grep -v inet6 | awk '{ print \$2 }' | sed s/addr\://"

alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gpr='git pull --rebase'

unalias rm
