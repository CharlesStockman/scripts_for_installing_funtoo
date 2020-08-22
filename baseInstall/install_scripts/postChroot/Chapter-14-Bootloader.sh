#!/bin/sh

#
# Add the grub package 
#	-a 	Prmopt to install
#	-v 	verbose
#
emerge -v grub

#
# Change the resolution of the terminal
#
#
sed -i '/GRUB_GFXMODE/cGRUB_GFXMODE=1024x768x32' /etc/default/grub
sed -i '/GRUB_GFXPAYLOAD_LINUX/cGRUB_GFXPAYLOAD_LINUX=keep' /etc/default/grub


#
# Create boot.conf file
#
createBootConf

#
# Install the Intel Microcode.  Not install if using AMD
#
# intel-microcode 
#
# iucode_tool is a program to manipulate microcode update collections for Intel® i686 and X86-64 system processors
# and prepare them for use by the Linux kernel
#
emerge intel-microcode iucode_tool

#
# UEFI Boot Entry
#    1. ( Note sure ) remount /sys
#    2. grub install
#		--target, -efi-dreictory should be self explanotory
#		--bootload-id=<string> -- A directory of that name will stored in boot and appear in the menu
#  		installs grub efi applicaton grubx64 to the correct dirctory and installs the module : /boot/grub/x86-64-efi
#
mount -o remount,rw /sys/firmware/efi/efivars
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id="Funtoo Linux [GRUB]" --recheck /dev/nvme0n1p1
ego boot update

function createBootConf() {

	$filename="/etc/boot.conf"

	#
	# Creates the boot menu
	#
	echo "boot {" >> $filename
	echo "	generate grub" >> $filename
	echo "	default "Funtoo Linux genkernel" >> $filename
	echo "	timeout 3" >> $filename
	echo "}" >> $filename
	echo "" >> $filename

	#
	# load a compressed kernel
	#	kernel -- which kernel to use.  If it is name bz image then it compress
	#	[-v] -- can be used at thye end of a kernel image name to match the base name or any combination of the base name,
	# 	plus a hyphen which will match bzImage or bzImage-*
	#
	echo "\"Funtoo Linux\" {" >> $filename
	echo "kernel bzImage[-v]" >> $filename
	echo "}" >> $filename
	echo "" >> $filename

	#
	# kernel -- will look for bzimage and bzimage-*
	#
	# initramfs
	#	The initramfs is an improved form of initrd, so initrd was blocked device image loaded into memory, 
	#	but it’s accessed like a block device, data that was read or written to it was cached by Linux.
	#	So we would load initrd into memory.
	#
	#	It’s just mounting that cache, so no duplication.
	#
	# parameters 
	# 	The parameters to boot the kernel 
	#
	echo "\"Funtoo Linux genkernel\" {" >> $filename
	echo "	kernel kernel[-v]" >> $filename
	echo "	initrd initramfs[-v]" >> $filename
	echo "" > $filename

	echo "	# IMPORTANT: Most users -- remember to REMOVE nomodeset below!" >> $filename
	echo "	params += real_root=auto rootfstype=auto nomodeset" >> $filename
	echo "}" >> $filename
}
