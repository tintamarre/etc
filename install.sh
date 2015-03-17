#!/bin/sh

DOTFILES="$(pwd)"
DEST="$HOME"
source_dirs="public private"
special_cases="config ssh atom"
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

config() {
    config_source=$1
    config_dest=$DEST/.config

    mkdir_if_absent $config_dest
    for config_f in $(list_files $config_source); do
        config_f_dst=$config_dest/$(basename $config_f)
        rm_if_present $config_f_dst
        ln -s $config_f $config_f_dst
    done
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

atom() {
    atom_source=$1
    atom_dest=$DEST/.atom

    mkdir_if_absent $atom_dest
    for atom_f in $(list_files $atom_source); do
        atom_f_dst=$atom_dest/$(basename $atom_f)
        rm_if_present $atom_f_dst
        ln -s $atom_f $atom_f_dst
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
        for f in $(list_files $DOTFILES/$sd); do
            if file_special_case $f; then
                $(basename $f) $f
            else
                standard_handler $f
            fi
        done
    done
}
main "$@"
