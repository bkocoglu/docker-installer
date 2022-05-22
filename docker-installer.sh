#!/bin/sh

#------------------------ Setup

echo '################### Docker Installer ###################'
echo ''
echo 'Before running this script, you need to have moved the docker file you downloaded with docker-downloader.sh to your remote server !'
echo ''
echo 'Should be move-run to remote server run before start !'
echo ''
echo 'Please run with root permission !'
echo ''
echo 'Please enter docker-x.tgz folder path (e.g "/Users/bkocoglu/Desktop/Dppm-Docker-Export/docker-installer") : '
echo ''
read workingPath
echo ''
echo 'Please enter docker-x.tgz file name (e.g "docker-20.10.6.tgz") : '
echo ''
read dockerFileName
echo ''
cd $workingPath
tar xzvf $dockerFileName
cp docker/* /usr/bin/
dockerd &
echo 'Docker installed.'