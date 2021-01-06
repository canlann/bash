# Source: https://github.com/DanMcInerney/wifijammer

## Install python2.7
<code>
sudo apt install python2
</code>
## Clone Repo
<code>
git clone https://github.com/DanMcInerney/wifijammer
cd wifijammer
</code>
## Connect supported wifi device

## Deactivate normal interface

### a) Disable current wifi
Go into Ubuntu WIFI-Settings. Click on the network you are in and uncheck "Connect automatically..."

Take Wifi into Airplane mode

Take Wifi back into normal mode

### b) Take normal iface down
List interfaces with:
<code>
ip a
</code>

Take down normal interface:
<code>
ifconfig wlp0 down
</code>
## List Accesspoints
<code>
sudo iwlist wlx9cefd5fbf646 scanning | egrep 'Cell |Encryption|Quality|Last beacon|ESSID|Channel'
</code>
## Start deauthenticating with

<code>
sudo python2.7 wifijammer -a Address-from-List -c Channel-from-List --world
</code>

## Optionally: Skip an MAC Address from being jammed
Add option:
-d -s MAC-Address
