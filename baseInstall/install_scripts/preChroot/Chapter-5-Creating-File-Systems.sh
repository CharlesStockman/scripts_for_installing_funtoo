#!/bin/sh

# Creates the files format and assumes:
#     partition 1 is the UEFI boot,
#     partition 2 is the swap
#     partition 3 contains the OS 
#
# -F -- Force

mkfs.vfat -F 32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
swapon /dev/nvme0n1p2
mkfs.ext4 -F /dev/nvme0n1p3 
