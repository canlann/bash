# Dual Boot HowTo

- BIOS/UEFI : Make sure Quick Boot or Fast Boot is inactive<br>
- BIOS/UEFI : Make sure it is UEFI not Leagcy<br>
- Windows   : Make sure it is installed with UEFI<br>
- Install Ubuntu with Advanced Options<br>
(Create a partition for the OS (ext4) and a partition for the swap (swap) ~30% bigger than the actual memory)<br>
- Reboot with the ubuntu installation usbstick<br>
- From there install boot-repair and install grub into the Windows EFI Partition<br>
