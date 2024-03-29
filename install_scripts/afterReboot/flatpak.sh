#! /bin/sh

#
# Enable kernel to generate namespaces for non-root users
#
echo 1 > /proc/sys/kernel/unprivileged_userns_clone
echo 'kernel.unprivileged_userns_clone=1' > /etc/sysctl.d/unprivileged_userns_clone.conf

#
# ensure the fuse module is loaded by default
#
echo "modules=\"fuse\"" >> /etc/conf.d/modules
modprobe fuse

# 
# Install Flatpak
#
emerge -v sys-apps/flatpak

#
# allow flatpak command to know which flatpak repository to use
#
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo --user

#
# Install Flatpak Software
# FlatPaks do not need root, but we want to make the script easier to write
#
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub com.brave.Browser

