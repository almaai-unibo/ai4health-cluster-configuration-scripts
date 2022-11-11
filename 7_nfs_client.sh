#!/bin/bash

# sudo bash ./7_nfs_client.sh <client-folder-name> <server-name> <server-ip> [opt: <server-folder-name>]

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Wrong arguments supplied ... exit."
    echo "Arguments to specify:"
    echo "      ./7_nfs_client.sh <client-folder-name> <server-name> <server-ip> [OPTIONAL: <server-folder-name>]"
    exit 1
fi

CLI_FOLDER=$1
SER_NAME=$2
SER_IP=$3
SER_FOLDER=$CLI_FOLDER

if [[ $4 ]]; then
	SER_FOLDER=$4
fi


apt update
apt install nfs-common -y

mkdir $CLI_FOLDER
echo "$SER_NAME:$SER_FOLDER   $CLI_FOLDER      nfs     defaults        0       0" >> /etc/fstab
echo "$SER_IP  $SER_NAME" >> /etc/hosts
mount -a



