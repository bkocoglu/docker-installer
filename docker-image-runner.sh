#!/bin/sh

#------------------------ Setup

echo '################### Docker Image Runner ###################'
echo ''
echo 'Should be move-run to remote server run before start !'
echo ''
echo 'Please enter working path (e.g "/root/dataspin") :'
echo ''
read workingPath
echo ''
cd $workingPath

#------------------------ Image Info

echo 'Please enter image tar file name (e.g "dpm-backend-0.0.1.tar or dpm-backend-0.0.1.tar.gz") :'
echo ''
read dockerImageTar
echo ''
echo 'Docker image loading...'
echo ''
docker load -i $dockerImageTar
echo 'Docker image loaded.'
echo ''
docker images
echo ''
echo 'Please enter container run parameters (e.g "-d --name dpm-frontend -p 8080:80 dpm-frontend:0.0.1 or --name docker_postgres -e POSTGRES_PASSWORD=Test -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres:13.3") : '
echo ''
read dockerRunParams
echo ''
docker run $dockerRunParams

# video 1:16.15
