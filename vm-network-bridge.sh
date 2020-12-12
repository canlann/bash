#!/bin/bash
# This didn not work on Ubuntu 20.04 if the iface is a wifi card
#Source: https://www.answertopia.com/ubuntu/creating-an-ubuntu-kvm-networked-bridge-interface/ 
nmcli con down "FRITZ!Box 7412"
nmcli con up br0
