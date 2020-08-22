#/bin/sh

#
# A tool to replace eselect from Gentoo.
#
ego sync

# (07/29/2020) -- Stage 3 has bindist USE Flag set ( control enabling/disabling for proprietary 
# and/or patented part of the binaries.  When you update the packages after an intial setup.
# To avoid problems before first boot run the following code
#

# -a 	Shows what will be emerged and ask if you to succeed
# -u	update the package we specify and if the package is already emerged don't emerge again
# -D	Deep Update ( Update packages and dependencies )
# -N	update packgages that have changed (new) USE setting
#
# -with-bdeps Compiles build dependecies
#
emerge -uDN --with-bdeps=y @world

#
# Create a make conf.
#
echo "USE=\" wifi -vala\" >> /etc/portage/make.conf
echo "MAKEOPTS=\"-j8\"" >> /etc/portage/make.conf
