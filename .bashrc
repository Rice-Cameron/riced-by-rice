#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -pla --color=auto'
alias grep='grep --color=auto'
alias agyd="agy --dangerously-skip-permissions"
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '

# Added by Antigravity CLI installer
export PATH="/home/cameronrice/.local/bin:$PATH"
. "$HOME/.cargo/env"
