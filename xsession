$HOME/etc/initxkb
xset r rate 185 130

eval `ssh-agent -s`
if [ -x /usr/lib/ssh/x11-ssh-askpass ]; then
    SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
    ssh-add < /dev/null &
fi

if [ -x /usr/lib/lxpolkit/lxpolkit ]; then
    # lxpolkit for Arch
    /usr/lib/lxpolkit/lxpolkit &
elif [ -x /usr/lib/x86_64-linux-gnu/lxpolkit ]; then
    # lxpolkit for Debian 64 bit
    /usr/lib/x86_64-linux-gnu/lxpolkit &
fi

[ -x $HOME/.wallpaper ] && $HOME/.wallpaper
[ -x $HOME/.xsession.local ] && $HOME/.xsession.local
[ -e $HOME/.Xresources ] && xrdb $HOME/.Xresources
[ -e $HOME/.Xresources.local ] && xrdb -override $HOME/.Xresources.local

i3

