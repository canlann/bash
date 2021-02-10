#!/bin/bash 

# Introduction
# This setups up a single port forwarding from the Host to the VM. Run the script on the Hostmachine Don't forget to set the parameters.
# Tested under Ubuntu 18.04
#
# E.g. 
# If you want to connect to the VM from any other computer in the LAN via ssh, you can use this script for it.
# This sets a Portforwarding from the Host to the VM to enable for example ssh access to the vm from LAN-Clients:
#
# ssh user_vm@ip_host -p 2222 
# 
# Source: https://aboullaite.me/kvm-qemo-forward-ports-with-iptables/

# Parameters to set before executing
PRIVATEIFACE="virbr0"  #Networkinterface name of VM
PUBLICIFACE="wlp4s0"   #Networkinterface name of Host
VMIP="192.168.122.54"  #Virtual-LAN IP of VM
PRIVATENETWORK="192.168.122.0/24" #Virtual-LAN Subnet
DPORT="2222" #Port of Host
SPORT="22" #Port of Guest


# Script content
# Connections from outside
iptables -I FORWARD -o $PRIVATEIFACE -d  $VMIP -j ACCEPT
iptables -t nat -I PREROUTING -p tcp --dport $DPORT -j DNAT --to $VMIP:$SPORT

# Masquerade local subnet
iptables -I FORWARD -o $PRIVATEIFACE -d  $VMIP -j ACCEPT
iptables -t nat -A POSTROUTING -s $PRIVATENETWORK -j MASQUERADE
iptables -A FORWARD -o $PRIVATEIFACE -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $PRIVATEIFACE -o $PUBLICIFACE -j ACCEPT
iptables -A FORWARD -i $PRIVATEIFACE -o lo -j ACCEPT

apt install -y netfilter-persistent
netfilter-persistent save
netfilter-persistent reload
netfilter-persistent start

apt install -y iptables-persistent
iptables-save > /etc/iptables/rules.v4