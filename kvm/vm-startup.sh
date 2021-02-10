#!/bin/bash

# This is a custom script to startup a virt-manager vm, mount it's samba-share and connect to it once it has booted.

IP="192.168.122.54"
VMNAME="ubuntu_18.04_erpnext"

virsh start $VMNAME
printf "%s" "waiting for $VMNAME"
while ! timeout 0.2 ping -c 1 -n $IP &> /dev/null
do
	printf "%c" "."
done
printf "\n%s\n" "$VMNAME is online. wait 5 sec."
printf "\n%s\n" "mounting smb share into /mnt/kvm_frappe on host."

# mount command probably needs to be adjusted for new vm
sudo mount -t cifs //$IP/marius /mnt/kvm_frappe -o uid=1000,rw,user=marius,password=Start123!

printf "\n%s\n" "connecting via ssh."
ssh marius@$IP
