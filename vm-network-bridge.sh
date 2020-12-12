#!/bin/bash

#Source: https://www.answertopia.com/ubuntu/creating-an-ubuntu-kvm-networked-bridge-interface/ 
nmcli con down "FRITZ!Box 7412"
nmcli con up br0
