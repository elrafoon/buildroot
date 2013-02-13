#!/bin/sh

set -e

ntpdate 192.168.11.1
hwclock --systohc
flash_erase /dev/mtd5 0 980
nandwrite /dev/mtd5 /root/rootfs.jffs2

echo "BOOTSTRAP OK"

