#!/bin/sh

#
# Modern Intel Chipsets
# If you have a modern intel system ( Skylake and newer) then deian-soruces kernel, has support for
# Modern Intel WiFi and integrated graphics Chipsets.  To use this kernel peform the following steps:
#
# Command line options for emerge ( -a is ask and -v is verbose )
echo "sys-kernel/debian-sources binary" >  /etc/portage/package.use
emerge -v debian-sources

# 
# Install sys-kernel/linux-firmware -- Starting at Broxton (a Skylake-based micro-architecture) 
# Intel CPUs require binary blobs for additional low-power idle states (DMC), graphics workload 
# scheduling on the various graphics parallel engines (GuC), and offloading some media functions 
# from the CPU to GPU (HuC).[1]
emerge -v linux-firmware
