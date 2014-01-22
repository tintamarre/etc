PATH="$PATH:/usr/local/bin"

# http://openbsd.org/faq/faq10.html
export LC_CTYPE="en_US.UTF-8"

# If you login from xdm, uncomment this to make error messages appear
# in the console window.
#
tail -f /home/zebdeos/.xsession-errors > /dev/console &

resources=$HOME/.Xresources
xmodmap=$HOME/.Xmodmap

if [ -f "$resources" ]; then
    /usr/X11R6/bin/xrdb -load "$resources"
fi

if [ -f "$xmodmap" ]; then
    /usr/X11R6/bin/xmodmap "$xmodmap"
fi

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

# feh --bg-fill /home/zebdeos/arc/wallpaper/deviantart/mycoria_speed_painting_by_karbo-d6tx2sb_cropped.jpg

exec startxfce4

