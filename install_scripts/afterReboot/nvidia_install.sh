#! /bin/sh

# Install the nvidia driver

#
# Blacklist Nouveau
#
cat << _end_of_text >> /etc/modprobe.d/nouveau-blacklist.conf
blacklist nouveau
options nouveau modeset=0
alias nouveau off
_end_of_text

#
# emerge packages.
#
emerge x11-drivers/nvidia-drivers x11-drivers/nvidia-kernel-modules

#
# For using nvidia (hardware acceleration) the user should be in the nvidia group
# It should ready be set in the following file : Chapter-16-Finishing-up.sh
# If not set then execute the following command below 
# usermod -a -G video myusername

#
# Create the new xorg.conf
#
nvidia-xconfig


