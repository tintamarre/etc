# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:$HOME/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.
export PATH HOME TERM

redwood=ftp://ftp5.usa.openbsd.org/pub/OpenBSD
boise=ftp://mirrors.syringanetworks.net/pub/OpenBSD
nyc=ftp://mirrors.nycbug.org/pub/OpenBSD
dallas=ftp://mirror.esc7.net/pub/OpenBSD
boulder=ftp://ftp3.usa.openbsd.org/pub/OpenBSD
export OBSD_MIRROR=$boulder
export PKG_PATH=$OBSD_MIRROR/snapshots/packages/`machine -a`/

#export PKG_CACHE=$HOME/arc/openbsd/mirror/pub/OpenBSD/snapshots/packages/`machine -a`

export CVSROOT=anoncvs@anoncvs3.usa.openbsd.org:/cvs

export PAGER=less

PS1="[\u@\h \W]$ "
alias ls="colorls -F"
alias lynx="lynx -nocolor"
alias e="emacsclient -c"
alias ee="emacsclient -n"

[ $TERM ] && [ $TERM = xterm ] && export TERM=xterm-256color

