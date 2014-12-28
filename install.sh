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
[ -e $HOME/.terminfo -o -L $HOME/.terminfo ] && rm -rf $HOME/.terminfo
[ -e $HOME/.sbclrc -o -L $HOME/.sbclrc ] && rm $HOME/.sbclrc
[ -e $HOME/.fluxbox -o -L $HOME/.fluxbox ] && rm -rf $HOME/.fluxbox

ln -s $HOME/etc/public/vimrc $HOME/.vimrc
ln -s $HOME/etc/public/gvimrc $HOME/.gvimrc
ln -s $HOME/etc/public/vim $HOME/.vim
ln -s $HOME/etc/public/emacs.d $HOME/.emacs.d
ln -s $HOME/etc/public/gitconfig $HOME/.gitconfig
ln -s $HOME/etc/public/hgrc $HOME/.hgrc
ln -s $HOME/etc/public/tmux.conf $HOME/.tmux.conf
ln -s $HOME/etc/public/jrnl_config $HOME/.jrnl_config
ln -s $HOME/etc/public/profile $HOME/.profile
ln -s $HOME/etc/public/zshrc $HOME/.zshrc
ln -s $HOME/etc/public/terminfo $HOME/.terminfo
ln -s $HOME/etc/public/sbclrc $HOME/.sbclrc
ln -s $HOME/etc/public/fluxbox $HOME/.fluxbox

[ -d $HOME/.ssh ] || mkdir $HOME/.ssh
[ -e $HOME/.ssh/authorized_keys -o -L $HOME/.ssh/authorized_keys ] && rm $HOME/.ssh/authorized_keys
[ -e $HOME/etc/private/ssh/authorized_keys ] && \
    cp -p $HOME/etc/private/ssh/authorized_keys \
        $HOME/.ssh/authorized_keys
[ -e $HOME/.ssh/id_rsa -o -L $HOME/.ssh/id_rsa ] && rm $HOME/.ssh/id_rsa
[ -e $HOME/etc/private/ssh/id_rsa  ] && \
    cp -p $HOME/etc/private/ssh/id_rsa \
        $HOME/.ssh/id_rsa
[ -e $HOME/.ssh/id_rsa.pub -o -L $HOME/.ssh/id_rsa.pub ] && rm $HOME/.ssh/id_rsa.pub
[ -e $HOME/etc/private/ssh/id_rsa.pub ] && \
    cp -p $HOME/etc/private/ssh/id_rsa.pub \
        $HOME/.ssh/id_rsa.pub

[ -d $HOME/local ] || mkdir $HOME/local
[ -d $HOME/local/tmp ] || mkdir $HOME/local/tmp
[ -d $HOME/local/bin ] || mkdir $HOME/local/bin
[ -d $HOME/local/xdg-dirs ] || mkdir $HOME/local/xdg-dirs
[ -d $HOME/local/xdg-dirs/Desktop ] || mkdir $HOME/local/xdg-dirs/Desktop
[ -d $HOME/local/xdg-dirs/Documents ] || mkdir $HOME/local/xdg-dirs/Documents
[ -d $HOME/local/xdg-dirs/Downloads ] || mkdir $HOME/local/xdg-dirs/Downloads
[ -d $HOME/local/xdg-dirs/Music ] || mkdir $HOME/local/xdg-dirs/Music
[ -d $HOME/local/xdg-dirs/Pictures ] || mkdir $HOME/local/xdg-dirs/Pictures
[ -d $HOME/local/xdg-dirs/Public ] || mkdir $HOME/local/xdg-dirs/Public
[ -d $HOME/local/xdg-dirs/Templates ] || mkdir $HOME/local/xdg-dirs/Templates
[ -d $HOME/local/xdg-dirs/Videos ] || mkdir $HOME/local/xdg-dirs/Videos

[ -d $HOME/.config ] || mkdir $HOME/.config
[ -e $HOME/.config/user-dirs.dirs -o -L $HOME/.config/user-dirs.dirs ] && \
    rm $HOME/.config/user-dirs.dirs
ln -s $HOME/etc/public/config/user-dirs.dirs \
    $HOME/.config/user-dirs.dirs
