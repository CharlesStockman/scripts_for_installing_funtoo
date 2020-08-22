#
# Create the portage repository and download the contents 
#

#
# Does not fit in here
#
export PS1="(chroot) $PS1"

# Create the directory and set attributes such as owner (-o) and group (-g)
install -d /var/git -o 250 -g 250

# Create the Portage Repository`
ego sync
