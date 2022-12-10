#!/bin/sh

#
# User Defined Variable
#
hostname="temporaryBase"

# Need to set a hostname -- Some ebuilds refuse to install when detecting
# localhost as hostname.
#
# -i Edit the text in place
# /c Replace selected lines in text
#
sed -i "/hostname/chostname=\"$hostname\"" /etc/conf.d/hostname

#
# linux-firmware -- neeed for WIFI cards
#
# NetworkManager is the de-facto network connection system for many Linux 
# distributions. NetworkManager supports mobile phone, wireless, and wired connections. NetworkManager 
# is intended to make configuring, and connecting easy
#
# rc-upate -- add and remove services to and from a runlevel
#
emerge linux-firmware networkmanager
rc-update add NetworkManager default
rc-update add dhcpcd default

