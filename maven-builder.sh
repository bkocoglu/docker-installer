#!/bin/sh

#------------------------ Setup

echo '################### MAVEN BUILDER ###################'
echo ''
echo 'Please enter project path (e.g "/Users/bkocoglu/Documents/projects/omreon/dataspin/dppm/dpm-backend or /Users/bkocoglu/Documents/projects/omreon/dataspin/datadiscovery") : '
echo ''
read projectPath
cd $projectPath

#----------------------- Maven Build

echo ''
echo 'Opened project path.'
echo ''
mvn clean install -DskipTests
echo ''
echo 'Maven build completed.'
echo ''

#------------------------- Docker Build

echo 'Please enter image name (e.g "dpm-backend" or "datadiscovery") : '
echo ''
read imageName
echo ''
echo 'Please enter image tag name (e.g "0.0.1") : '
echo ''
read imageTag
echo ''
echo 'Docker build starting...'
echo ''
docker build -t $imageName:$imageTag .
echo ''
echo 'Docker build completed.'
echo ''
docker images
echo ''

#------------------------- Docker Export

echo 'Starting docker export process...'
echo ''
echo 'Do you want export to custom folder ? (System export to this folder by default) (yes or no)'
echo ''
read exportFolderSelection
echo ''
exportPath=$(pwd)
if [[ $exportFolderSelection == 'yes' ]]; then
	echo 'Please enter custom export folder path : '
	echo ''
	read exportPath
fi
echo 'Export path : '
echo ''
echo $exportPath
echo ''
cd $exportPath
currentDate=$(date +"%T")
folderNamePrefix="docker-maven-export-"
exportFolderName="$folderNamePrefix$currentDate"
mkdir $exportFolderName
echo "Created Export Folder (Name = ${exportFolderName})"
echo ''
fullExportPath="$exportPath/$exportFolderName"
cd $fullExportPath
dockerImageFileName="$imageName-$imageTag.tar.gz"
docker save $imageName:$imageTag | gzip > $dockerImageFileName
echo "Completed Docker image export. Path = $fullExportPath/$dockerImageFileName"
echo ''





