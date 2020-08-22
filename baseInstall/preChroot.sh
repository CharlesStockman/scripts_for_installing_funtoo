#/bin/sh

user="CharlesStockman"
project="install_funtoo"
branch="master"
section="baseInstall"

path=$user/$project/$branch
site="raw.githubusercontent.com"

preCommitDir="baseInstall/install_scripts/preChroot"

if [ ! -d scripts ]
then 
	mkdir scripts
	cd scripts
fi

wget https://$site/$path/$preCommitDir/Chapter-5-Creating-File-Systems.sh
wget https://$site/$path/$preCommitDir/Chapter-5a-Mounting-Filesystems.sh
wget https://$site/$path/$preCommitDir/Chapter-6-Setting-the-Date.sh
wget https://$site/$path/$preCommitDir/Chapter-7-Install-the-Funtoo-stage-tarball.sh

sh ./Chapter-5-Creating-File-Systems.sh
sh ./Chapter-5a-Mounting-Filesystems.sh
sh ./Chapter-6-Setting-the-Date.sh
sh ./Chapter-7-Install-the-Funtoo-stage-tarball.sh
