# mksh
PS1="# " ; (( USER_ID )) && PS1="$ "

PATH="$PATH:$HOME/bin:$HOME/local/bin"
unalias -a
alias e=vim

# stuff for vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt

# stuff for python pip
export PIP_DOWNLOAD_CACHE="$HOME/arc/pip-cache"

