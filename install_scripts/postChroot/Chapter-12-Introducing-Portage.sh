#/bin/sh

#
# A tool to replace eselect from Gentoo.
#
ego sync

# -u	update the package we specify and if the package is already emerged don't emerge again
# -D	Deep Update ( Update packages and dependencies )
# -N	update packgages that have changed (new) USE setting
#
# -with-bdeps Compiles build dependecies
#
emerge -uDN --with-bdeps=y @world
