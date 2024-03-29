# install_funtoo
A set of scripts that follow the instructions from https://www.funtoo.org/Install/Introduction to install Funtoo to the
point where the user can log into the system, use a GUI ( X windows ) and Flatpak functionally is installed. 

## Use Cases

* For the creation of virtual machine
    * Create a virtual environment that can be easily removed so large change or installing software with a lot of dependencies can be tested.
    * To simulate a distributed environment where I have more than one machine.  An example use case could be microservice projects.
    * Speculation, When doing a source based upgrade a virtual machine could be created to compile the code then install the code on the current physical hardware.  The advantage would you have full access to your host machine while the code is compiling.

## Base Install

The table below illustrates the configuration decisions.

Task | Information
-----|------------
Retrieve Minimal Installation CD | From the following list select a livecd : https://www.funtoo.org/Funtoo:New_Install_Experience/LiveCD/Releases
Disk Configuration | UEFI will be used <br/> Partition : Type - EFI System <br/> Partition : Type - Swap <br/> Partition : Type - Linux Filesystem <br/><br/> All partititions should be on the same disk.
kernel | A pre-built debian-sources kernel 
Timezone | America/New_York
Time     | Set using the hardware clock
locale | The locale will be en_US
Neworking | Use Ethernet
Environment | The developer is root and the git is present

**On the Machine where funtoo is being installed** 

1. Boot up a live distribution
>>Create an USB by burning iso from the table with the Task : Retrieve Minimal Installation CD<br>
>>Create an USB that will contain the files from : https://github.com/CharlesStockman/scripts_for_installing_funtoo.git<br>

>> Insert the Funtoo USB and start system 

>>Create a mount point to access the files to create the system
>>>mkdir /mnt/usb<br>
>>>mount /dev/sdb1 /mnt/usb<br>
>>>cd /mnt/usb/scripts_for_intalling_funtoo

2. Run the Script that handles all commands before preChroot
> * (cd /root/scripts_for_installing_funtoo ; sh ./baseInstall/preChroot.sh )
> * The script will perform the following:
>> * Create the filesystem for each partition
>> * Mount the partitions where the base software will be installed to.
>> * Copy the time to the hardware clock so it persists when the system reboots
>> * Extract the Stage 3 Tarball to /mnt/funtoo 
   
3. Run the script that handles the chroot:
> * cd /root/scripts_for_installing_funtoo/ ; sh ./Chapter-9-Chroot-Into-Funtoo.sh 
> * The script will do the following 
>> * Mounts the /proc, /sys and /dev that were mounted in the preChroot section
>> * From the live distro copy the resolv.conf to the /mnt/funtoo
>> * chroot
>>
> * Access the Scripts
>> * mkdir -p /mnt/usb
>> * mount /dev/sdb1 /mnt/usb
>> * cd /mnt/usb
   
4. Run the scripts that handle post Chroot:
> * cd /root/scripts_for_installing_funtoo/; sh ./postChroot.sh
> * The scripts will perform the following
>> * Download the portage tree
>> * Create the configuration for /etc
>> * Sync the Portage and perform a full update
>> * Install a kernel
>> * Install and configure grub
>> * Set up the networking environment
>> * Change the root user's passwd and create a new user
>> * Configure the system for random numbers
>> * Set the initial passwords and update them on startup<br>
>
> At the very end the installer should do a reboot / shutdown / turn off & on

5. Run the scripts and actions that handle after reboot
> * Login as root<br>
>> * Change the passwd for both cstockman and root
> * cd /root/scripts_for_installing_funtoo/; sh ./afterReboot.sh
> * The scripts will perform the following
>> * Set the global configuration of the system.
>> * Install the gnome desktop environment
>> * Install the nvidia drviers
>> * Install flatpak.sh
>> * Emerge programs needed for linuxConfiguration project ( used to configure a linux type system )
>
> * execute create_initrc.sh <user to create .xinitrc for> to create a .xinitrc file for a user ( ex. create_xinitrc.sh ctockman )
