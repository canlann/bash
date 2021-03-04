#!/bin/sh

# Private Key Usage Instruction: Sei vorsichtig und gehe von alleine ~ Felix Gracioso Garcia
# Copy all files from this folder into my ~/.ssh/ folder.
# Go into the ~/.ssh/ folder change the parameter in the file setup.sh in the new location.
# Then in the future if I want to access a remote server with my private key I need to copy the public key
# onto the server with:
# ssh-copy-id -i ~/.ssh/id_ecdsa_USGovStd_github.pub some_username@IP_ADDRESS_OF_A_SERVER 
# Alternatively it can get imported from my github repository (not tested yet) by connecting to the target server, then
# ssh-import-id gh:Canlann

# Parameters
username="marius"

sudo apt-get update
sudo apt-get install openssh-server
sudo apt install openssh-client
sudo ufw allow ssh
sudo systemctl enable ssh

# Add private key to access servers that hold my key
sudo chmod 600 ~/.ssh/*
exec ssh-agent bash
ssh-add id_ecdsa_USGovStd_github
ssh-add id_ecdsa_id_ed25519_OpenSSH_tuit
ssh-add -l

# Add public key to this host so that I can connect to it
touch ~/.ssh/authorized_keys
cat id_ecdsa_USGovStd_github.pub >> authorized_keys
chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
chown -R $username:$username ~/.ssh
