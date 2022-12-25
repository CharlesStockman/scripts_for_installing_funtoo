#!/bin/sh

#
# Blacklist Nouveau Driver so it does not load automatically and interfere wiht the official Nvidia Driver
#
# modeset is used to tell Kernel Mode Set to not load this driver at 
#
$filename="/etc/modprobe.d/nouveau-blacklist.conf"

echo "blacklist nouveau" 	 	>> $filename
echo "options nouveau modeset=0" 	>> $filename
echo "alias nouveau off" 		>> $filename

#
# Good news, we are using a pre build kernel.  If you need to develop your own kernel then verify that
# the following must be enabled in the kernel configuration
#
#	Enable loadable module support 
#	MTRR ( Memory Type Range Register ) support 
#	Device Drivers --> Graphics Support --> Support for frame buffer devices
#		NVIDIA FrameBuffer Support
#		NVIDIA Riva Support
#
# Merge the nvidia drivers
#

emerge x11-drivers/nvidia-drivers x11-drivers/nvidia-kernel-modules

#
# Nvidia needs to be part of the user group for hardware accelleration
#
usermod -a -G video root


#
# In make conf set the Video Cards variable
#
echo "VIDEO_CARDS=\"nvidia\"" >>  /etc/portage/make.conf

#
# Test the card
#


#result=`glxinfo | grep direct`
#if [[ $result == "direct rendering: yes" ]]
#echo "gpu accelleration"
#fi
echo $result
