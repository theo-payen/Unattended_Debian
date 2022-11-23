#!/bin/sh
url=$1
curl -LO# $url

xorriso -osirrox on -indev debian-10.1.0-amd64-netinst.iso  -extract / isofiles/

chmod +w -R isofiles/install.amd/
gunzip isofiles/install.amd/initrd.gz

echo preseed.cfg | cpio -H newc -o -A -F isofiles/install.amd/initrd

gzip isofiles/install.amd/initrd

chmod -w -R isofiles/install.amd/

sed 's/vesamenu.c32//g' isolinux/isolinux.cfg > isolinux/isolinux.cfg

cd isofiles/
chmod a+w md5sum.txt
md5sum `find -follow -type f` > md5sum.txt
chmod a-w md5sum.txt
cd ..
chmod a+w isofiles/isolinux/isolinux.bin
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o debian-10-unattended.iso isofiles