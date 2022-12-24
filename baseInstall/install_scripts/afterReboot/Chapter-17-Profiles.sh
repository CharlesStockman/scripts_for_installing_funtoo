#!/bin/sh

#
# Set the following profiles to configure the system
#
epro arch x86-64bit
epro subarch intel64-skylake
epro flavor desktop

epro mix-in +gfxcard-nvidia
epro mix-in +gnome
epro mix-in -print
epro mix-in +no-systemd


#
# Update the new system 
#  
# -u    update to the new version possible.  May not be the current due to masking issues
# -D    Updates all the software in the system including dependencies
# -N    install any software based on the new use flgs
emerge -auDN @world

# Update the system after the upgrade
etc-update
boot-update
