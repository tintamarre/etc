#!/bin/sh

# Where your public dotfiles are located; required
DOTFILES=$HOME/etc

# Where your private dotfiles are located; optional
PRIVATE=$DOTFILES/private

# The destination to symlink in the dotfiles
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

# TODO: Handle various signals the script might receive, deal with
# them gracefully

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

# If we reach this point, all prerequisite directories exist...

    # TODO: DO THIS THING!

    # loop through all dotfiles (exclude hidden and $PRIVATE)
    #    symlink to $DEST/$dotfile prepended with '.'
    # loop through all private dotfiles (exclude hidden)
    #    symlink to $DEST/$dotfile prepended with '.'

    # TODO: What if a symlink already exists? should warn user

    # TODO: Should we offer to remove existing symlink if it exists?

    # TODO: What if a real file exists where we want to put a symlink?

    # TODO: Should we offer to back up the existing conflicting file?
