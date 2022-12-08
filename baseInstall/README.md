## Base Install

The purpose of this section is to describe how to setup the base install including 
> * setting up the kernel 
> * grub 
> * network 

Task | Information
-----|------------
Retrieve Minimal Installation CD | URL: https://cdn-pull.funtoo.org/livecd/funtoo-livecd-20221008-1908.iso<br/>
Disk Configuration | UEFI will be used <br/> Partition : Type - EFI System <br/> Partition : Type - Swap <br/> Partition : Type - Linux Filesystem <br/><br/> Use Only one disk
Timezone | The Timezone will be Eastern
locale | The locale will be en_US
Neworking | Use Ethernet

**On the Machine where funtoo is being installed** 

1. Boot up a live distirbution
>>Currently I am using the live version of the Funtoo CD

2. Bring up a command line and connect to the internet and switch to the root user ( either by sudo or su )

3. Download the repository: git clone https://github.com/CharlesStockman/scripts_for_installing_funtoo.git

4. Run the Script that handles all comnands before the user does a chroot
> (cd /root/scripts_for_installing_funtoo/baseInstall/ ; sh ./preChroot.sh )

> * Assumptions The disk is partitioned into three parts
>> * The first partition is the UEFI Boot
>> * The second partition is the swap space 
>> * The third partition will contain the distribution

>> * The script will perform the following
>> * Create the filesystem for each partition
>> * Mount the partititions where the base software will be installed to.
>> * Copy the time to the hardware clock so it persists when the system reboots
>> * Extract the Stage 3 Tarball to /mnt/funtoo 
   
6. Run the script that handles the chroot
> * wget https://raw.githubusercontent.com/CharlesStockman/scripts_for_installing_funtoo/master/baseInstall/Chapter-9-Chroot-Into-Funtoo.sh
> * sh ./Chapter-9-Chroot-Into-Funtoo.sh

> * The script will do the following
>> * Mounts the /proc, /sys and /dev
>> * From the live distro copy the resolv.conf to the /mnt/funtoo
>> * chroot
   
7. Run the script that handles 
> * ( mkdir $HOME/scripts ; cd $HOME/scripts )
    
> * wget https://raw.githubusercontent.com/CharlesStockman/scripts_for_installing_funtoo/master/reuseable.sh
> * In the top level directory execute "source reusable.sh" to load the reusable functions that will be used by more than one script. 
    
> * wget https://raw.githubusercontent.com/CharlesStockman/scripts_for_installing_funtoo/master/baseInstall/postChroot.sh
> * sh ./postChroot.sh
   
> * The scripts will perform the following
>> * Download the portage tree
>> * Create the configuration for /etc
>> * Sync the Portage and perform a full update
>> * Install a kernel
>> * Install and configure grub
>> * Set up the networking environment
>> * Change the root user's passwd and create a new user
>> * configure the system for random numbers
