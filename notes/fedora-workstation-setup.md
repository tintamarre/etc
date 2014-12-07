# Fedora Setup Notes

Starting with Fedora 21 Workstation Beta 4.

## Update and initial setup:

    $ sudo yum update

Enable sshd:

    $ sudo systemctl enable sshd
    $ sudo systemctl start sshd

Install zsh, git, gvim, emacs:

    $ sudo yum install zsh git gvim emacs

Reboot.

## Install dotfiles

Copy data via rsync/ssh.

Install dotfiles.

    $ cd ~/gandalf/src/github/bayprogrammer/dotfiles
    $ sh install.sh

Activate zsh as shell:

    $ chsh -s /usr/bin/zsh

Reboot or relog.

## Install packages:

$ cd ~/gandalf/src/github/bayprogrammer/dotfiles/scripts
$ sudo yum install `sh flatten_pkg_list.sh ../notes/fedora-packages.txt`

Log out, log back in to MATE Desktop.

## Configure MATE Desktop

Compile and install stumpwm (see stumpwm-fedora.md).

Once installed, open dconf-editor, navigate to:

org.mate.session.required-components

Then set windowmanager to stumpwm.

Configure just one top MATE panel. Default menu, shortcuts, taskbar, workspace
switcher, tray, clock.

Relog for stumpwm to be active with MATE. It should replace its modeline with
the solitary MATE panel we've configured.

## Mate Terminal Settings

Edit > Profile Preferences > General:

Uncheck Show menubar by default in new terminals.

Edit > Profile Preferences > Colors:

Use White on Black as base theme, set background color to #242424.

Set Built-in schemas to Tango.

Edit > Profile Preferences > Scrolling:

Set scrollbar is Disabled.

## Keyboard Settings

System > Preferences > Hardware > Keyboard:

Under General tab:

Delay: quite short

Speed: quite fast

Under Layouts tab:

Click Options...

Under Caps Lock key behavior, select "Make Caps Lock an additional ESC"

Confirm, then, from the dialog click Add...

Under By language tab:

Language: English

Variants: English (US) English (Colemak)

Once added, you can switch between US English Querty and Colemak layouts easily
from the language tray applet.

## Screen Lock Timeout Settings

System > Preferences > Look and Feel > Screensaver

Change "Regard the computer as idle after" to 30 minutes.

## Virtualization & Containerization

libvirtd should be automatically enabled and started; but if necessary:

    $ sudo systemctl enable libvirtd
    $ sudo systemctl start libvirtd

We need to create a policy to allow members of wheel access to administer / control libvirt:

    $ sudo vim /etc/polkit-1/rules.d/51-libvirtwheel.rules

File should contain:

    polkit.addRule(function(action, subject){
        if (action.id == "org.libvirt.unix.manage" &&
            subject.isInGroup("wheel")) {
                return polkit.Result.YES;
        }
    });

From Virtual Machine Manager, ensure you can connect to localhost (QEMU) and
localhost (LXC) without having to enter you password. Add those connections if
necessary. You should also be able to access libvirt from the virtual machine
manager for other systems with your user in wheel over ssh if you've created
the needed polkit rule to allow access to wheel users. May need to reboot after
installing the virtualization packages for the local libvirt access to be fully
functional.

### Enable nested virtualization for KVM:

See http://my-techno-arena.blogspot.com/2014/08/installing-kvm-in-lubuntu1404-with.html

    $ sudo cat /sys/module/kvm_intel/parameters/nested
    N
    $ sudo -s
    # echo 'options kvm_intel nested=1' >> /etc/modprobe.d/qemu-system-x86.conf
    $ sudo shutdown -r now
    $ sudo cat /sys/module/kvm_intel/parameters/nested
    Y

- TODO: Optional: Configure bridged networking
- TODO: Docker & LXC

## Install and setup communications apps

(as applicable):

- Hexchat
- Pidgin & OTR
- Thunderbird & Enigmail

---

- TODO: Firewall configuration (via UFW?)
- TODO: Install Vagrant
- TODO: Install keybase client
- TODO: Install Rust
