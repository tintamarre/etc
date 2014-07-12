# mksh
PS1="# " ; (( USER_ID )) && PS1="$ "

PATH="$PATH:$HOME/bin:$HOME/local/bin"

# per http://guides.rubygems.org/faqs/#user-install
if which ruby 1>/dev/null 2>&1 && which gem 1>/dev/null 2>&1; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# if [ -d $HOME/.rbenv/bin ]; then
#     PATH="$HOME/.rbenv/bin:$PATH"
#     eval "$(rbenv init -)"
# fi

export PATH

unalias -a
alias e=vim

# stuff for vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt

# stuff for python pip
export PIP_DOWNLOAD_CACHE="$HOME/arc/pip-cache"

