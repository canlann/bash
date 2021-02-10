# Introduction

A collection of different scripts and configs for development and terminal use.<br>

Make sure to look at the hidden dot files too<br>
        
    ls -la

# Files

The root directory of this repo contains various scripts and configs.<br>

<ul>
    <li>dualboot.md => Readme on how to create a dualboot with Windows and Ubuntu</li>
    <li>setup_ubuntu_20.04.sh => Script for my personal default packages on Ubuntu 20.04</li>
    <li>smb.conf => My personal samba default configuration file</li>
</ul>

# Folders

## kvm

This is useful if you want to set up a kvm virtual machine under ubuntu (18.04). <br>

<ul>
    <li>smb.conf.localguest => Default Configuration for /etc/samba/smb.conf</li>
    <li>vm-network-bridge.sh => Bashscript for enabling connections to the VM from a different computer in the LAN (not working yet)</li>
    <li>vm-network-bridge.xml => Configuration for above</li>
    <li>vm-network-iptables.sh => Bashscript for portforwarding Host to VM (e.g. ssh into vm from LAN-Client with ssh user_vm@host_ip -p 2222)</li>
    <li>vm-startup.sh => Custom Script for VM Startup (replaces necessity for virt-manager GUI-Application for booting)</li>
</ul>

## itsecurity


Different itsecurity exercises.<br>

<ul>
    <li>tor-install.sh => Setting up TOR from Ubuntu with a specific country as ExitNode. (Remember: The Dark Web uses linklists instead of search engines, *.onion-urls and has no DNS-Servers.)</li>
    <li>wifijammer.md => Readme to setup a Wifijammer from Ubuntu 20.04 (Remember: For real attacks you need 2.4 / 5 Ghz Wifi-Card and possibly long range)</li>
</ul>

## vscode
<ul>
    <li>settings.json => Settings file for Visual Code</li>
</ul>

## tmux

Configuration and Setup of tmux.<br>

<ul>
    <li>.tmux.conf => Configuration with installation instructions</li>
    <li>tmux.sh => Read instructions in .tmux.conf</li>
</ul>

##