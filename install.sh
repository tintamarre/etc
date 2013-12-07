#!/bin/sh

# Where your public dotfiles are located; required; full pathname
DOTFILES=$HOME/etc

# Where your private dotfiles are located; optional; full pathname
PRIVATE=$DOTFILES/private

# The destination to symlink in the dotfiles; full pathname
DEST=$HOME

# TODO: Allow specifying the three settings via commandline flags:
# -o DOTFILES ORIGIN
# -p PRIVATE ORIGIN
# -d DESTINATION

# TODO: Need a -h help print out

echo_err() {
    echo "$1" 1>&2
}

hostname_local() {
    hostname | cut -f 1 -d '.'
}

# TODO: Host-specific .local conf files?
# (e.g. ~/.profile.local -> etc/local/bree/profile on bree)

if ! [ -e $DOTFILES -a -d $DOTFILES ]; then
    echo_err "Dotfiles location, '$DOTFILES',"
    echo_err "does not exist or is not a directory. Aborting."
    exit 1
fi

# if $PRIVATE doesn't exist, we just move on (it's optional)
if [ -e $PRIVATE ]; then
    if ! [ -d $PRIVATE ]; then
        echo_err "Private dotfiles location, '$PRIVATE',"
        echo_err "exists but is not a directory. Aborting."
	exit 1
    fi
fi

if ! [ -e $DEST -a -d $DEST ]; then
    echo_err "Destination, '$DEST',"
    echo_err "does not exist or is not a directory. Aborting."
    exit 1
fi

for f in $DOTFILES/*; do

    # Ignore files ending in '~'
    if echo "$f" | grep -qv '~$'; then

        # Don't symlink the $PRIVATE directory
        if ! [ "X$f" = "X$PRIVATE" ]; then
            f_basename=$(basename "$f")
            dest="$DEST/.$f_basename"

            # TODO: test: use 'not equal' rather than inversion?
            if ! [ "X$f_basename" = "Xinstall.sh" ]; then
                if ! [ -e "$dest" ]; then
                    # TODO: Warn user if the symlink couldn't be made
                    # TODO: If symlink couldn't be made, offer to back
                    #       up original file (moving it out of the way)
                    #       and try again?? (maybe overkill..)
                    ln -s "$f" "$dest"
                fi
            fi
            # TODO: Test with spaces...
        fi
    fi
done

for f in $PRIVATE/*; do
    if echo "$f" | grep -qv '~$'; then
        f_basename=$(basename "$f")
        dest="$DEST/.$f_basename"
        if ! [ -e "$dest" ]; then
            ln -s "$f" "$dest"
        fi
    fi
done
