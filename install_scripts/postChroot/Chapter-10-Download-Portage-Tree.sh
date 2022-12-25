#!/bin/sh

#
# Install the repository which contains the package scripts that tell portage how to build and install thousands of software 
# packages

#
# Create the directory and set the owner and group
#
install -d /var/git -o 250 -g 250

#
# Sync the repository
#
ego sync
