#
# Change the passsword for root 
#
echo "root:unixmac10" | chpasswd

#
# Add an user
# 	-m create the user's home directory
#	-G groups
#
# Groups
#	wheel 	Allow your user account to su into root
# 	audio	Allows account to directly access audio devices
#		needed for Alsa
#	plugdev Allows your account to work with removable drivers
#		Allows adding of a WIFI network in Gnome
#	portage	Allows extended use of portage as a regular user
#
useradd -m cstockman
usermod -G wheel,audio,plugdev,portage cstockman
echo "cstockman:unixmac10" | chpasswd
