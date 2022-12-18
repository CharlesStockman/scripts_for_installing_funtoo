## Base Install

The table beliow illustrates the configuration decisions.

Task | Information
-----|------------
Retrieve Minimal Installation CD | URL: https://cdn-pull.funtoo.org/livecd/funtoo-livecd-20221008-1908.iso<br/>
Disk Configuration | UEFI will be used <br/> Partition : Type - EFI System <br/> Partition : Type - Swap <br/> Partition : Type - Linux Filesystem <br/><br/> All partititions shoudl be on the same disk.
kernel | A pre-built debian-sources kernel 
Timezone | America/New_York
Time     | Set using the hardware clock
locale | The locale will be en_US
Neworking | Use Ethernet
Environment | The developer is root and the git is present

**On the Machine where funtoo is being installed** 

1. Boot up a live distirbution
>>Currently I am using the live version of the Funtoo CD

2. Download the repository: git clone https://github.com/CharlesStockman/scripts_for_installing_funtoo.git

3. Run the Script that handles all comnands before preChroot
> (cd /root/scripts_for_installing_funtoo/baseInstall/ ; sh ./baseInstall/preChroot.sh )

> * The script will perform the following
>> * Create the filesystem for each partition
>> * Mount the partititions where the base software will be installed to.
>> * Copy the time to the hardware clock so it persists when the system reboots
>> * Extract the Stage 3 Tarball to /mnt/funtoo 
   
4. Run the script that handles the chroot
> (cd /root/scripts_for_installing_funtoo/baseInstall/ ; sh ./Chapter-9-Chroot-Into-Funtoo.sh ) 

> * The script will do the following 
>> * copy the script_for_installing_funtoo to /mnt/funtoo/root so they are available after the chroot 
>> * Mounts the /proc, /sys and /dev that were mounted in the preChroot section
>> * From the live distro copy the resolv.conf to the /mnt/funtoo
>> * chroot
   
5. Run the scripts that handle post Chroot
> * ( mkdir $HOME/scripts ; cd $HOME/scripts ; sh ./postChroot.sh )
   
> * The scripts will perform the following
>> * Download the portage tree
>> * Create the configuration for /etc
>> * Sync the Portage and perform a full update
>> * Install a kernel
>> * Install and configure grub
>> * Set up the networking environment
>> * Change the root user's passwd and create a new user
>> * Configure the system for random numbers
>> * Set the initial passwords and update them on startup

At the very end the installer should do a reboot / shutdown / turn off & on

6. Run the scripts that handle the handle repot
> * Login as root<br>
> * Change the passwd for both cstockman and root
> * execute afterReboot/Chapter-17-Profiles.sh to set the global configuration of the system.
> * execute afterReboot/install_gnome.sh to install the gnome desktop environment
> * execute afterReboot/nvidia_install.sh to install the nvidia drviers
> * execute afterReboot/flatpak.sh
