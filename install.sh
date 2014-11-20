#!/bin/sh

[ -e $HOME/.vimrc -o -L $HOME/.vimrc ] && rm $HOME/.vimrc
[ -e $HOME/.gvimrc -o -L $HOME/.gvimrc ] && rm $HOME/.gvimrc
[ -e $HOME/.vim -o -L $HOME/.vim ] && rm -rf $HOME/.vim
[ -e $HOME/.emacs.d -o -L $HOME/.emacs.d ] && rm -rf $HOME/.emacs.d
[ -e $HOME/.gitconfig -o -L $HOME/.gitconfig ] && rm $HOME/.gitconfig
[ -e $HOME/.hgrc -o -L $HOME/.hgrc ] && rm $HOME/.hgrc
[ -e $HOME/.tmux.conf -o -L $HOME/.tmux.conf ] && rm $HOME/.tmux.conf
[ -e $HOME/.jrnl_config -o -L $HOME/.jrnl_config ] && rm $HOME/.jrnl_config
[ -e $HOME/.profile -o -L $HOME/.profile ] && rm $HOME/.profile
[ -e $HOME/.zshrc -o -L $HOME/.zshrc ] && rm $HOME/.zshrc
[ -e $HOME/.vim -o -L $HOME/.terminfo ] && rm -rf $HOME/.terminfo

ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/gvimrc $HOME/.gvimrc
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/vim $HOME/.vim
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/emacs.d $HOME/.emacs.d
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/hgrc $HOME/.hgrc
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/jrnl_config $HOME/.jrnl_config
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/profile $HOME/.profile
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/terminfo $HOME/.terminfo

[ -d $HOME/.ssh ] || mkdir $HOME/.ssh
[ -e $HOME/.ssh/authorized_keys -o -L $HOME/.ssh/authorized_keys ] && rm $HOME/.ssh/authorized_keys
[ -e $HOME/gandalf/src/private/dotfiles-private/ssh/authorized_keys ] && \
    cp -p $HOME/gandalf/src/private/dotfiles-private/ssh/authorized_keys \
        $HOME/.ssh/authorized_keys
[ -e $HOME/.ssh/id_rsa -o -L $HOME/.ssh/id_rsa ] && rm $HOME/.ssh/id_rsa
[ -e $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa  ] && \
    cp -p $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa \
        $HOME/.ssh/id_rsa
[ -e $HOME/.ssh/id_rsa.pub -o -L $HOME/.ssh/id_rsa.pub ] && rm $HOME/.ssh/id_rsa.pub
[ -e $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa.pub ] && \
    cp -p $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa.pub \
        $HOME/.ssh/id_rsa.pub

[ -d $HOME/finglas ] || mkdir $HOME/finglas
[ -d $HOME/finglas/tmp ] || mkdir $HOME/finglas/tmp
[ -d $HOME/finglas/bin ] || mkdir $HOME/finglas/bin
[ -d $HOME/finglas/xdg-dirs ] || mkdir $HOME/finglas/xdg-dirs
[ -d $HOME/finglas/xdg-dirs/Desktop ] || mkdir $HOME/finglas/xdg-dirs/Desktop
[ -d $HOME/finglas/xdg-dirs/Documents ] || mkdir $HOME/finglas/xdg-dirs/Documents
[ -d $HOME/finglas/xdg-dirs/Downloads ] || mkdir $HOME/finglas/xdg-dirs/Downloads
[ -d $HOME/finglas/xdg-dirs/Music ] || mkdir $HOME/finglas/xdg-dirs/Music
[ -d $HOME/finglas/xdg-dirs/Pictures ] || mkdir $HOME/finglas/xdg-dirs/Pictures
[ -d $HOME/finglas/xdg-dirs/Public ] || mkdir $HOME/finglas/xdg-dirs/Public
[ -d $HOME/finglas/xdg-dirs/Templates ] || mkdir $HOME/finglas/xdg-dirs/Templates
[ -d $HOME/finglas/xdg-dirs/Videos ] || mkdir $HOME/finglas/xdg-dirs/Videos

[ -d $HOME/.config ] || mkdir $HOME/.config
[ -e $HOME/.config/user-dirs.dirs -o -L $HOME/.config/user-dirs.dirs ] && \
    rm $HOME/.config/user-dirs.dirs
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/config/user-dirs.dirs \
    $HOME/.config/user-dirs.dirs
