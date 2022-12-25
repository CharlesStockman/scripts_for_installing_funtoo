#!/bin/sh

# Copy the time so the hardware clock to the hardware close so it persists across reboots
hwclock --hctosys
