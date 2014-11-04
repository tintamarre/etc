#!/bin/bash

# script by 'cYrus' from here:
# http://superuser.com/questions/285381/how-does-the-tmux-color-palette-work/285400#285400

for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
done
