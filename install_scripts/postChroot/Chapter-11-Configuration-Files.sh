#/bin/sh

# Copy the fstab file to /etc
fstab=`find . -name fstab`
cp $fstab /etc/fstab

# Set the time zone where your computer is located
#
# -s -- Symbolic
# -f -- force
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
