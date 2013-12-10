dotfiles
========

Introduction
------------

Configuration files (aka dotfiles) for the BayProgrammer.

Uses git-submodules where possible. Don't forget to initialize
those after cloning if cloning directly from repository.

Foundational "weapons of choice" include:

- ksh
- tmux
- X Windows System (X11)
    - i3 & cwm window managers
- Emacs 24 (non-gui version)

Currently being used only on OpenBSD systems, but nothing intentionally
precludes use on a different Unix-like operating system.

Boostrapping with install.sh
----------------------------

The install.sh script is a work in progress but currently can be
used to bootstrap the dotfiles into your home directory. Tested using
OpenBSD sh, but should work fine with other Bourne-style shells such
as bash and dash.

**TODO**: More info on install.sh forthcoming...
