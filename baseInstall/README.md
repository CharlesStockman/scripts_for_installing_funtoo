## Base Install

The purpose of this section is to describe how to setup the base install and configure including setting up the kernel, grub and the network for the new system.

1. Boot up a Live version.  Current I am using the live version of POP OS.

2. Bring up a command line and connect to the internet

3. Switch to the root user ( either by sudo or su )

5. Run the Script that handles all comnands before the user does a chroot
   * wget https://raw.githubusercontent.com/CharlesStockman/install_funtoo/master/baseInstall/preChroot.sh
   * sh ./preChroot.sh

   * Assumptions The disk is partitioned into three parts
     * The first partition is the UEFI Boot
     * The second partition is the swap space 
     * The thirrd partition will contain the distribution

   * The script will perform the following
     * Create the filesystem for each partition
     * Mount each partition.  For example mount the third partition as /mnt/funtoo
     * Copy the time to the hardware clock so it persists when the system reboots
     * Extract the Stage 3 Tarball to /mnt/funtoo 
   
6. Run the script that handles the chroot
    * wget https://raw.githubusercontent.com/CharlesStockman/install_funtoo/master/Chapter-9-Chroot-Into-Funtoo.sh
    * sh ./Chapter-9-Chroot-Into-Funtoo.sh

    * The script will do the following
      * Mounts the /proc, /sys and /dev
      * From the live distro copy the resolv.conf to the /mnt/funtoo
      * chroot
   
7. Run the script that handles 
    * ( mkdir $HOME/scripts ; cd $HOME/scripts )
    
    * wget https://raw.githubusercontent.com/CharlesStockman/install_funtoo/master/reusable.sh
      * In the top level directory execute "source reusable.sh" to load the reusable functions that will be used by more than one script. 
    
    * wget https://raw.githubusercontent.com/CharlesStockman/install_funtoo/master/postChroot.sh
      * sh ./postChroot.sh
    
    * The scripts will perform the following
      * Download the portage tree
      * Create the configuration for /etc
      * Sync the Portage and perform a full update
      * Install a kernel
      * Install and configure grub
      * Set up the networking environment
      * Change the root user's passwd and create a new user
      * configure the system for random numbers