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
#
autoload -U promptinit
promptinit
prompt redhat

