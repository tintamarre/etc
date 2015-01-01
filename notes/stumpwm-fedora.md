# Compile and Install stumpwm on Fedora

Just interim manual compilation and installation notes until I learn how to
properly package apps as RPMs for Fedora.

These notes assume sbcl, git, and texinfo have been installed already from the
official repos.

Mostly installed via the prodecures documented here:
https://github.com/stumpwm/stumpwm

## Install quicklisp

    $ mkdir ~/local/build
    $ cd ~/local/tmp
    $ curl -O http://beta.quicklisp.org/quicklisp.lisp
    $ sbcl --load quicklisp.lisp
    * (quicklisp-quickstart:help)
    * (quicklisp-quickstart:install)

I also ran:

    * (ql:add-to-init-file)

the first time, which gave me my initial ~/.sbclrc, now added to my dotfiles.
Don't add quicklisp stuff to your ~/.sbclrc unless needed for the first time.
Also, if necessary (which was for me the first time), move the quicklisp
directory and upadate your .sbclrc:

    $ mv ~/quicklisp ~/.quicklisp
    $ vi ~/.sbclrc

Updated the peritnent part of the .sbclrc file as so:

    ;;; The following lines added by ql:add-to-init-file:
    #-quicklisp
    (let ((quicklisp-init (merge-pathnames ".quicklisp/setup.lisp"
                                           (user-homedir-pathname))))
      (when (probe-file quicklisp-init)
        (load quicklisp-init)))

## Install stumpwm dependencies

Using quicklisp we install the dependencies needed by stumpwm (not currently
avaialable directly from the Fedora repos:

    $ sbcl
    * (ql:quickload "clx")
    * (ql:quickload "cl-ppcre")

## Configure, compile, and install stumpwm

    $ cd ~/local/build
    $ git clone https://github.com/stumpwm/stumpwm.git
    $ cd stumpwm
    $ autoconf
    $ ./configure --prefix=$HOME/local
    $ make
    $ make install
