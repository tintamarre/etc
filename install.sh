#!/bin/sh

DOTFILES="$(pwd)"
DEST="$HOME"
source_dirs="public private"
special_cases="config ssh atom fonts"
ignore="attic gitconfig_cit hgrc_cit"

list_files() {
    pathname=$1
    exclude_regex='~$\|#'
    for i in $ignore; do
        exclude_regex="$exclude_regex\|$i"
    done
    for lf in $(ls -1 $pathname | grep -v "$exclude_regex"); do
        echo $pathname/$lf
    done
}

mkdir_if_absent() {
    [ -d $1 ] || mkdir $1
}

rm_if_present() {
    [ -e $1 -o -L $1 ] && rm -rf $1
}

ssh() {
    ssh_source=$1
    ssh_dest=$DEST/.ssh

    mkdir_if_absent $ssh_dest
    chmod 750 $ssh_dest
    for ssh_f in $(list_files $ssh_source); do
        ssh_f_dst=$ssh_dest/$(basename $ssh_f)
        rm_if_present $ssh_f_dst
        cp -p $ssh_f $ssh_f_dst
    done
}

config() {
    config_source=$1
    config_dest=$DEST/.config
    merge_handler "$config_source" "$config_dest"
}

atom() {
    atom_source=$1
    atom_dest=$DEST/.atom
    merge_handler "$atom_source" "$atom_dest"
}

fonts() {
    fonts_source=$1
    fonts_dest=$DEST/.fonts
    merge_handler "$fonts_source" "$fonts_dest"
}

merge_handler() {
    merge_source=$1
    merge_dest=$2

    mkdir_if_absent $merge_dest
    for merge_f in $(list_files $merge_source); do
        merge_f_dst=$merge_dest/$(basename $merge_f)
        rm_if_present $merge_f_dst
        ln -s $merge_f $merge_f_dst
    done
}

standard_handler() {
    file_source=$1
    file_dest=$DEST/.$(basename $1)
    rm_if_present $file_dest
    ln -s $file_source $file_dest
}

bootstrap_home() {
    local="$DEST/local"
    local_dirs="tmp bin xdg-dirs"
    xdg="$local/xdg-dirs"
    xdg_dirs="Desktop Documents Downloads Music Pictures Public Templates Videos"

    mkdir_if_absent $local
    mkdir_if_absent $xdg

    for d in $local_dirs; do
        mkdir_if_absent $local/$d
    done

    for d in $xdg_dirs; do
        mkdir_if_absent $xdg/$d
    done
}

file_special_case() {
    filename=$(basename $1)
    for sc in $special_cases; do
        if [ $sc = $filename ]; then
            return 0
        fi
    done
    return 1
}

main() {
    bootstrap_home
    for sd in $source_dirs; do
        # only loop through members of $sd if it exists
        if [ -d "$sd" ]; then
            for f in $(list_files $DOTFILES/$sd); do
                if file_special_case $f; then
                    $(basename $f) $f
                else
                    standard_handler $f
                fi
            done
        fi
    done
}
main "$@"
