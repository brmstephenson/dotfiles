#!/bin/bash

alias tmux='tmux -2'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias hostip="ifconfig wlan0 | grep inet | grep -v inet6 | awk '{ print \$2 }' | sed s/addr\://"

alias gs='git status'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias glog='git log'
alias gd='git diff'
alias gpr='git pull --rebase'

alias dsar='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'

unalias rm 2>/dev/null

alias npmexec='PATH=$(npm bin):$PATH'

alias webpack='npmexec webpack'
alias webpack-dev-server='npmexec webpack-dev-server'
alias gulp='npmexec gulp'
alias http-server='npmexec http-server'
alias karma='npmexec karma'
alias babel-node='npmexec babel-node'
alias nodemon='npmexec nodemon'
alias eslint='npmexec eslint'

alias fix="git diff --name-only | uniq | xargs vim"
alias nr='npm run'
