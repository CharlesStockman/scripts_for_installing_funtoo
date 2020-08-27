#/bin/sh

user="CharlesStockman"
project="install_funtoo"
branch="master"

path=$user/$project/$branch/
site="raw.githubusercontent.com"

postCommitDir="baseInstall/install_scripts/postChroot"

if [ ! -d scripts ]
then	
	mkdir scripts
	cd scripts
fi

wget https://$site/$path/$postCommitDir/Chapter-10-Download-Portage-Tree.sh
wget https://$site/$path/$postCommitDir/Chapter-11-Configuration-Files.sh
wget https://$site/$path/$postCommitDir/Chapter-12-Introducing-Portage.sh
wget https://$site/$path/$postCommitDir/Chapter-13-Install-a-kernel.sh 
wget https://$site/$path/$postCommitDir/Chapter-14-A-Nvidia-Driver.sh
wget https://$site/$path/$postCommitDir/Chapter-14-Bootloader.sh
wget https://$site/$path/$postCommitDir/Chapter-15-Networkmanager.sh
wget https://$site/$path/$postCommitDir/Chapter-16-Finishing-up.sh
wget https://$site/$path/$postCommitDir/Chapter-16-Configuring-Random.sh

wget https://$site/$path/$postCommitDir/data/fstab

sh ./Chapter-10-Download-Portage-Tree.sh 	; echoEndString
sh ./Chapter-11-Configuration-Files.sh		; echoEndString
sh ./Chapter-12-Introducing-Portage.sh		; echoEndString
sh ./Chapter-13-Install-a-kernel.sh 		; echoEndString
sh ./Chapter-14-A-Nvidia-Driver.sh              ; echoEndString
sh ./Chapter-14-Bootloader.sh			; echoEndString
sh ./Chapter-15-Networkmanager.sh		; echoEndString
sh ./Chapter-16-Finishing-up.sh			; echoEndString
sh ./Chapter-16-Configuring-Random.sh		; echoEndString
