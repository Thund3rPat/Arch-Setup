# How to install Arch Step by Step
Little cheat sheet to install Arch.

## Preparation
Load German Key layout:
```
loadkeys de-latin1
```

## Partition your Disk
Lookup current block devices:
```
lsblk
```

On UEFI:
```
gdisk /dev/sda
o
Y
# Partition for efi boot partition
n
Enter
Enter
+512MiB
ef00
# partition for swap
n
Enter
Enter
+512MiB
8200
# partition for linux filesystem
n
Enter
Enter
8300
# check partition then write
p
w
Y
```
## Make Filesystem
1. EFI (Boot):
```
mkfs.fat -F 32 -n EFIBOOT /dev/sda1
```

2. Root:
```
mkfs.ext4 -L p_arch /dev/sda3
```

3. Swap:
```
mkswap -L p_swap /dev/sda2
```

## Mount
```
mount -L p_arch /mnt         # root
mkdir -p /mnt/boot
mount -L EFIBOOT /mnt/boot   # EFI
swapon -L p_swap             # swap
```

## Install Basesystem
Connect to Internet via LAN or wifi-menu.

Get 15 fastest Mirrors in Germany:
```
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
pacman -Sy
pacman -S reflector
reflector --latest 15 --protocol http --protocol https --country 'Germany' --sort rate --save /etc/pacman.d/mirrorlist
```

Install Base packets:
```
pacstrap /mnt base base-devel linux linux-firmware nano vim
```

More packages:
```
pacman --root /mnt -S dhcpcd bash-completion intel-ucode/amd-ucode wpa_supplicant netctl dialog networkmanager
```
## Create fstab
```
genfstab -Lp /mnt > /mnt/etc/fstab
```

## Chroot
Change into System:
```
arch-chroot /mnt/
```

Set Hostname:
```
echo Arch > /etc/hostname
```

Set Display Language:
```
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

Configure locale.gen
```
nano /etc/locale.gen
# uncomment these four
de_DE.UTF-8 UTF-8
de_DE ISO-8859-1
de_DE@euro ISO-8859-15
en_US.UTF-8

locale-gen
```

Set Terminal Keymap and Font:
```
echo KEYMAP=de-latin1 > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf
```

Set Timezone:
```
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
```

Create Initramfs:
```
mkinitcpio -p linux
```

Set Root PW:
```
passwd
```
## Install Bootloader
```
pacman -S efibootmgr dosfstools gptfdisk grub
```

```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch_grub --recheck --debug
grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot
```
exit
umount -R /mnt
reboot
```

## More Config
Add user, set password and add to sudoers file and other groups:
```
useradd -m -g users -s /bin/bash thunderpat
passwd thunderpat
pacman -S sudo
vim /etc/sudoers
# uncomment this
## Uncomment to allow members of group wheel to execute any command
wheel ALL=(ALL) ALL

gpasswd -a thunderpat wheel
gpasswd -a thunderpat audio
gpasswd -a thunderpat video
gpasswd -a thunderpat games
gpasswd -a thunderpat power
```

Enable practical services:
```
systemctl enable --now fstrim.timer

pacman -S acpid dbus avahi cups
systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable org.cups.cupsd.service
systemctl enable NetworkManager.service

systemctl enable --now systemd-timesyncd.service

hwclock -w
```

This completes the installation of Arch.