#/bin/sh

# Copy the fstab file to /etc
cp fstab /etc/fstab

# Set the time zone where your computer is located
#
# -s -- Symbolic
# -f -- force
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

#
# TODO: For now the make.conf is going here until a script is created for it 
#
# CFLAGS and CXXFLAGS -- CFLAGS is meant for C programs and CXXFLAGS is meant for C++ programs
# LINGUAS --  used by some gettext-based build systems to control which localization files are built and installed.
#
# wifi and -vala was choosen so network manager could install
# examples and doc was choosen to more information about the commands
# 
# 
$useFlags="wifi -vala doc examples"
$compilerOptions="-march=skylake -O2 -pipe"

echo "CFLAGS=\"$copmpilerOptions\"" 		>> /etc/portage/make.conf
echo "CXXFLAGS=\"$copmpilerOptions\""		>> /etc/portage/make.conf
echo "USE=\"$useFlags\""			>> /etc/portage/make.conf
echo "MAKEOPTS=\"-j8\"" 			>> /etc/portage/make.conf
echo "LINGUAS=\"en_us\""			>> /etc/portage.make.conf
