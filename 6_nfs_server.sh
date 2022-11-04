#!/bin/sh

if [ -z "$1" ]
  then
    echo "No argument supplied, please specify the NFS directory name ... exit."
    exit 1
fi

apt-get update
apt-get install nfs-kernel-server -y

chown -R nobody:nogroup $1
chmod 777 $1
echo "$1	192.168.11.0/24(rw,sync,no_subtree_check)" >> /etc/exports

exportfs -a
systemctl restart nfs-server
