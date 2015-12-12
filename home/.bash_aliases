alias tmux='tmux -2'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias hostip="ifconfig wlan0 | grep inet | grep -v inet6 | awk '{ print \$2 }' | sed s/addr\://"

alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gpr='git pull --rebase'

alias dsar='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'

unalias rm

alias npmexec='PATH=$(npm bin):$PATH'

alias webpack='npm-exec webpack'
alias gulp='npm-exec gulp'
alias http-server='npm-exec http-server'
