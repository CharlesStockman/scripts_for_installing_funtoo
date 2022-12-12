#!/bin/sh

#
# Set the following profiles to configure the system
#
epro arch x86-64bit
epro subarch intel64-skylake
epro flavor desktop


epro profile mix-in gfxcard-nvidia
epro profile mix-in gnome
epro profile
epro no-systemd

#
# Update the new system 
#  
# -u    update to the new version possible.  May not be the current due to masking issues
# -D    Updates all the software in the system including dependencies
# -N    install any software based on the new use flgs
emerge -auDN @world

# Upate the system
etc-update
boot-update
