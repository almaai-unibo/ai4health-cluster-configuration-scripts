#!/bin/bash

# ---------- Remove Lastest Kernel ----------

apt remove --purge --fix-broken linux-generic-hwe-20.04 linux-oem-20.04 linux-hwe-* linux-oem-* linux-modules-5.1* linux-image-5.1* -y
