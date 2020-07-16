Build instructions:

Configure kernel:
 - CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc make 83xx/meru_ap320_defconfig

Build a uImage:
 - CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc make

This will build 'arch/powerpc/boot/uImage.initrd.meru-ap320', however it requires an existing initramfs at 
'arch/powerpc/boot/arch/powerpc/boot/ramdisk.image.gz'.

Build uImage manually:
```
mkimage -A powerpc -O linux -T multi -C gzip -a <address> -e <entry> -n "<name>" -d <kernel.gz>:<initrd.gz>:<dtb.gz> <uImage>
```
