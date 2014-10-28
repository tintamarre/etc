#!/bin/sh

[ -e $HOME/.vimrc -o -L $HOME/.vimrc ] && rm $HOME/.vimrc
[ -e $HOME/.gitconfig -o -L $HOME/.gitconfig ] && rm $HOME/.gitconfig
[ -e $HOME/.hgrc -o -L $HOME/.hgrc ] && rm $HOME/.hgrc
[ -e $HOME/.tmux.conf -o -L $HOME/.tmux.conf ] && rm $HOME/.tmux.conf
[ -e $HOME/.jrnl_config -o -L $HOME/.jrnl_config ] && rm $HOME/.jrnl_config
[ -e $HOME/.profile -o -L $HOME/.profile ] && rm $HOME/.profile
[ -e $HOME/.zshrc -o -L $HOME/.zshrc ] && rm $HOME/.zshrc
[ -e $HOME/.fluxbox -o -L $HOME/.fluxbox ] && rm -r $HOME/.fluxbox
[ -e $HOME/.Xresources -o -L $HOME/.Xresources ] && rm $HOME/.Xresources
[ -e $HOME/.xsession -o -L $HOME/.xsession ] && rm $HOME/.xsession

ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/hgrc $HOME/.hgrc
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/jrnl_config $HOME/.jrnl_config
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/profile $HOME/.profile
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/fluxbox $HOME/.fluxbox
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/Xresources $HOME/.Xresources
ln -s $HOME/gandalf/src/github/bayprogrammer/dotfiles/dotfiles/xsession $HOME/.xsession

[ -d $HOME/.ssh ] || mkdir $HOME/.ssh
[ -e $HOME/.ssh/authorized_keys -o -L $HOME/.ssh/authorized_keys ] && rm $HOME/.ssh/authorized_keys
[ -e $HOME/gandalf/src/private/dotfiles-private/ssh/authorized_keys ] && \
    ln -s $HOME/gandalf/src/private/dotfiles-private/ssh/authorized_keys \
        $HOME/.ssh/authorized_keys
[ -e $HOME/.ssh/id_rsa -o -L $HOME/.ssh/id_rsa ] && rm $HOME/.ssh/id_rsa
[ -e $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa  ] && \
    ln -s $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa \
        $HOME/.ssh/id_rsa
[ -e $HOME/.ssh/id_rsa.pub -o -L $HOME/.ssh/id_rsa.pub ] && rm $HOME/.ssh/id_rsa.pub
[ -e $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa.pub ] && \
    ln -s $HOME/gandalf/src/private/dotfiles-private/ssh/id_rsa.pub \
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
