#!/bin/sh

# Where your public dotfiles are located; required; full pathname
DOTFILES=$HOME/etc

# Where your private dotfiles are located; optional; full pathname
PRIVATE=$DOTFILES/private

# The destination to symlink in the dotfiles; full pathname
DEST=$HOME

IGNORE_LIST="$(basename $PRIVATE) install.sh local README.md ssh"

echo_err() {
    echo "$1" 1>&2
}

hostname_local() {
    hostname | cut -f 1 -d '.'
}

in_list() {
    list_element=$1
    list=$2

    echo "$list" | grep -qF "$list_element"
}

# Return 0 if file_to_check is found in IGNORE_LIST
ignore_file() {
    file_to_check=$1

    in_list $file_to_check "$IGNORE_LIST"
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

link_files() {
    $SOURCE_LOC=$1

    for f in $SOURCE_LOC/*; do

        # Ignore files ending in '~'
        if echo "$f" | grep -qv '~$'; then
            f_basename=$(basename "$f")

            # Don't symlink any files we're supposed to ignore
            if ! ignore_file "$f_basename"; then
                dest="$DEST/.$f_basename"

                # Only try to link to dest if it isn't already there
                if ! [ -e "$dest" ]; then
                    ln -s "$f" "$dest"
                fi
            fi
        fi
    done
}

link_files "$DOTFILES"
link_files "$PRIVATE"
