# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:$HOME/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH HOME TERM

PAGER=less
VISUAL=vim
EDITOR=vim
export PAGER EDITOR

. $HOME/.profile.private


PS1="\W \$ "

set -o emacs
alias lynx="lynx -nocolor"

