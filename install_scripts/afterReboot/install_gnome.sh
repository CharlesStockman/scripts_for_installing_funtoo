#! /bin/sh 

#
# Install the gnome environment since that is the recommended desktop for Funtoo
# I am installing this current desktop environemnt, but will new ones later on.
#
emerge sys-fs/fuse
emerge x11-terms/gnome-terminal
emerge gnome-light

#
# configure openrc to autostart dbus and elogind:
#
rc-update add dbus default
rc-update add elogind default
