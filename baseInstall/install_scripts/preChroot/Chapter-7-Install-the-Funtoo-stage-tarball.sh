#!/bin/sh

# Downloads the initial image and untars the image in /mnt/funtoo
# Should have execute Chapter-5a-Mounting-FileSystems.sh

cd /mnt/funtoo
wget https://build.funtoo.org/1.4-release-std/x86-64bit/generic_64/stage3-latest.tar.xz
tar --numeric-owner -xpf /mnt/funtoo/stage3-latest.tar.xz
rm /mnt/funtoo/stage3-latest.tar*
