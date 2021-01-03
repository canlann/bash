sudo apt install -y tor
sudo apt install -y torbrowser-launcher
sudo apt install -y proxychains
sudo echo "ExitNodes {gb}" >> /etc/tor/torrc
sudo systemctl status tor
proxychains firefox
