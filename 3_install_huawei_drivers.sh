#!/bin/bash

# ---------- Install Dependencies ----------

apt-get install net-tools gcc make -y

# ---------- Install Drivers ----------

groupadd HwHiAiUser
useradd -g HwHiAiUser -d /home/HwHiAiUser -m HwHiAiUser -s /bin/bash
actual_administrator=$(echo "$USER")
usermod -a -G HwHiAiUser $actual_administrator

is3010=$(lspci | grep Huawei | grep d100 | wc -l)
is9000=$(lspci | grep Huawei | grep d801 | wc -l)

if [ $is3010 -gt 0 ]; then
	echo "Intalling Model 3010 Drivers ......................."
	bash ./NPU/3010/*npu-driver_*.run --full
	bash ./NPU/3010/*npu-firmware_*.run --full

elif [ $is9000 -gt 0 ]; then
        echo "Intalling Model 9000 Drivers ......................."
        bash ./NPU/9000/*npu-driver_*.run --full
        bash ./NPU/9000/*npu-firmware_*.run --full

else
	echo "[ERROR]: Suitable driver not found."
	exit 0

fi

# ---------- Output Test ----------

npu-smi info

