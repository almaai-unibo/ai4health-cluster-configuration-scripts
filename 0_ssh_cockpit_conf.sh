#!/bin/bash

# ---------- Configuration of SSH Server ----------

apt-get update
apt-get upgrade -y
apt-get install openssh-server -y
systemctl enable sshd --now

# ---------- Cockpit installation ----------

apt-get install cockpit -y
systemctl enable --now cockpit.socket

