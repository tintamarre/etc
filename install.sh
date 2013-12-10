#!/bin/sh

# Where your public dotfiles are located; required; full pathname
DOTFILES=$HOME/etc

# Where your private dotfiles are located; optional; full pathname
PRIVATE=$DOTFILES/private

# The destination to symlink in the dotfiles; full pathname
DEST=$HOME

echo_err() {
    echo "$1" 1>&2
}

hostname_local() {
    hostname | cut -f 1 -d '.'
}

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

            # TODO: test: use ... != ... rather than inversion?
            if ! [ "X$f_basename" = "Xinstall.sh" ]; then
                if ! [ -e "$dest" ]; then
                    ln -s "$f" "$dest"
                fi
            fi
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
