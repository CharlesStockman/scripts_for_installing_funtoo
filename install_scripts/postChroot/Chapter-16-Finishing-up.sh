#
# Change the passsword for root 
# For Root Password : must have 2 letter, 2 numbers and 2 punctuation.
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
echo "cstockman:01abc!!" | chpasswd
