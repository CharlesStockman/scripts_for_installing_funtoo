#
# Change the passsword for root 
#
echo "root:01abc!!" | chpasswd

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
#       video	Allows hardware accelleration
#
useradd -m cstockman
usermod -G wheel,audio,plugdev,portage,video cstockman
echo "cstockman:12345678" | chpasswd
