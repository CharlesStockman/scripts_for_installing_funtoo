#
# Create the portage repository and download the contents 
#

#
# Create a prompt to identity the chroot terminal
#
export PS1="(chroot) $PS1"

#
# Create the directory and set attributes such as owner (-o) and group (-g)
#
install -d /var/git -o 250 -g 250

#
#  clone the portage tree from GitHub and all kits:
#
ego sync
