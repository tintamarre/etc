$HOME/etc/initxkb
xset r rate 185 130

[ -x /usr/lib/lxpolkit/lxpolkit ] && /usr/lib/lxpolkit/lxpolkit &
[ -x $HOME/.wallpaper ] && $HOME/.wallpaper
[ -x $HOME/.xsession.local ] && $HOME/.xsession.local
[ -e $HOME/.Xresources ] && xrdb $HOME/.Xresources
[ -e $HOME/.Xresources.local ] && xrdb -override $HOME/.Xresources.local

i3

