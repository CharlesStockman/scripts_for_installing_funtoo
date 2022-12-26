#
# Create and copy the .xinitrc file to the correct user
#

#
# Verify arguments
# 
if [ -z $1 ]
then
  echo "No user has been specified.  A user is needed to know where the script should be copied to."
else 
  user=$1
fi

#
# Create the xinitrc file
#
cat > xinitrc << "END"
# Fix Missing Applications in Gnome
export XDG_MENU_PREFIX=gnome-

# Properly Launch the Desired X Session
exec gnome-session
END

mv xinitrc /home/$user/.xinitrc
chown $1:$1 /home/$user/.xinitrc
chmod 644 /home/$user/.xinitrc
