# Mount ntfs drive

Look for the right drive with: \\

    sudo blkid

or: \\

    sudo lsblk

Run ntfsfix in case there is remaining Windwos Metadata on the Drive: \\

    sudo ntfsfix /dev/sdxY


Mount: \\

    sudo mkdir /media/newfolder
    sudo mount -t ntfs -o umask=007,gid=046,uid=0,nls=utf8 /dev/sdxY /media/newfolder

# Special Case Ubuntu: Premounted drives

Ubuntu mounts disks that have been connected since boot automatically under /media/user. If it is read-only it needs to be fixed: \\

    sudo umount /dev/sdxY

    sudo ntfsfix /dev/sdxY

    sudo mount -t ntfs -o umask=007,gid=046,uid=0,nls=utf8 /dev/sdxY /media/user/foldername

# Source

https://wiki.ubuntuusers.de/mount/#Datentraeger-einhaengen \\