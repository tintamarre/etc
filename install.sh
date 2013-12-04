#!/bin/sh

# Where your public dotfiles are located
DOTFILES=$HOME/etc

# Where your private dotfiles are located
# TODO: should this be optional?
PRIVATE=$HOME/etc/private

# The destination to symlink in the dotfiles
DEST=$HOME

# TODO: Host-specific .local conf files?
# (e.g. ~/.profile.local -> etc/local/bree/profile on bree)

# TODO: Handle various signals the script might receive, deal with
# them gracefully

if ! [ -e $DOTFILES -a -d $DOTFILES ]; then
    # $DOTFILES doesn't exist, or isn't a directory...
    echo "'$DOTFILES' does not exist or is not a directory."
    echo 'Aborting.'
    exit 1
fi

# TODO: check for existance of $PRIVATE
#     -e $PRIVATE -a -d $PRIVATE -a
# TODO: check for existance of $DEST
#     -e $DEST -a -d $DEST ]; then

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
