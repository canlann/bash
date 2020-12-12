#!/bin/bash 

#Source: https://aboullaite.me/kvm-qemo-forward-ports-with-iptables/

VMIP="192.168.122.54"
PRIVATEIFACE="virbr0"
PUBLICIFACE="wlp4s0"
PRIVATENETWORK="192.168.122.0/24"
DPORT="8080" #Port of Host where to connect to
SPORT="8000" #Port of Guest vm where it should go to

# connections from outside
iptables -I FORWARD -o $PRIVATEIFACE -d  $VMIP -j ACCEPT
iptables -t nat -I PREROUTING -p tcp --dport $DPORT -j DNAT --to $VMIP:$SPORT

# Masquerade local subnet
iptables -I FORWARD -o $PRIVATEIFACE -d  $VMIP -j ACCEPT
iptables -t nat -A POSTROUTING -s $PRIVATENETWORK -j MASQUERADE
iptables -A FORWARD -o $PRIVATEIFACE -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $PRIVATEIFACE -o $PUBLICIFACE -j ACCEPT
iptables -A FORWARD -i $PRIVATEIFACE -o lo -j ACCEPT

apt install -y netfilter-persistent
service netfilter-persistent save
service netfilter-persistent reload

#Now you can:
#ssh user@$VMIP -p $SPORT
