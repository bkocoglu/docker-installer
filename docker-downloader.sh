#!/bin/sh

#------------------------ Setup

echo '################### Docker Downloader ###################'
echo ''
echo 'Please enter working path (e.g "/Users/bkocoglu/Desktop/Dppm-Docker-Export/docker-installer") : '
echo ''
read workingPath
cd $workingPath
echo ''
echo 'Open Working Folder'

#----------------------- Download Docker

echo ''
echo 'Please enter docker version (e.g "20.10.6") : '
echo ''
read dockerVersion
echo ''
echo 'Docker Download Started'
dockerFileName="docker-$dockerVersion.tgz"
echo ''
curl -L -o $dockerFileName https://download.docker.com/linux/static/stable/x86_64/$dockerFileName 
echo ''
echo 'Docker Download Completed'
echo ''
dokcerFilePath="$workingPath/$dockerFileName"

#----------------------- SCP Info

echo 'Please enter server IP : (e.g "104.248.31.10")'
echo ''
read serverIP
echo ''
echo 'Please enter username : '
echo ''
read username
echo ''
echo 'Please enter server working path : (e.g "/root/dataspin")'
echo ''
read serverWorkingPath
echo ''
scpCommand="scp -r $dokcerFilePath $username@$serverIP:$serverWorkingPath"
echo "Please run this command : $scpCommand"