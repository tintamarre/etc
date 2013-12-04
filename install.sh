#!/usr/sh

DOTFILES=$HOME/etc
PRIVATE=$HOME/etc/private
DEST=$HOME

# TODO: How on earth should we unit test this thing?

# TODO: check for existence of $DOTFILES
# TODO: check for existance of $PRIVATE
# TODO: check for existance of $DEST

# loop through all dotfiles (exclude hidden and $PRIVATE)
#    symlink to $DEST/$dotfile prepended with '.'
# loop through all private dotfiles (exclude hidden)
#    symlink to $DEST/$dotfile prepended with '.'

# TODO: What if a symlink already exists? should warn user

# TODO: Should we offer to remove existing symlink if it exists?

# TODO: What if a real file exists where we want to put a symlink?

# TODO: Should we offer to back up the existing conflicting file?
