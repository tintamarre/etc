# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zebdeos/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ---------------------------------------------------------------------

[ "x$TERM" = "xxterm" ] && export TERM="xterm-256color"

PS1="⛈ ⦗%n•%m %1~⦘%(#.#.⚡) "

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

alias e=vim

# TODO: Check for non-BSD ls and fallback to non-alias or colorls
alias ls="ls --color -F"

# stuff for vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt

# stuff for python pip
export PIP_DOWNLOAD_CACHE="$HOME/arc/pip-cache"

