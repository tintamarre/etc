# mksh
PS1="# " ; (( USER_ID )) && PS1="$ "

PATH="$PATH:$HOME/bin:$HOME/local/bin"
unalias -a
alias e=vim

VAGRANT_DEFAULT_PROVIDER=libvirt
export VAGRANT_DEFAULT_PROVIDER

