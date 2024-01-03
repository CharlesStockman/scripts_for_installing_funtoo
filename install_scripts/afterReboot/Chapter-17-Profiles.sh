#!/bin/sh

#
# Set the following profiles to configure the system
#
epro arch x86-64bit
epro subarch intel64-skylake
epro flavor desktop
epro build next

epro mix-in +gfxcard-nvidia
epro mix-in +gnome
epro mix-in -print
epro mix-in +no-systemd
epro mix-in +wayland
epro mix-in +cinnamon
epro mix-in +console
epro mix-in +dvd
epro mix-in +kde-plasma-5-new
epro mix-in +xfce
epro mix-in -X


#
# Update the new system 
#  
# -u    update to the new version possible.  May not be the current due to masking issues
# -D    Updates all the software in the system including dependencies
# -N    install any software based on the new use flgs
emerge -uDN @world

# Update the system after the upgrade
etc-update
boot-update
