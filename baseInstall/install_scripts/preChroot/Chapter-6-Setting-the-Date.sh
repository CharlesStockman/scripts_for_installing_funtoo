#!/bin/sh

# Copy the time to the hardware clock once the date is set manually.
# run date without any options and if you correct then do not changed

# To set the date manually use the following command: date 071620002011
#   where 07 is July, 16 is 16th where 2000 is 20:00 UTC and 2011 is the year

# Copy the time so the hardware clock to the hardware close so it persists across reboots
hwclock --systohc
