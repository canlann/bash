sudo apt update
sudo apt install -y tmux
sudo apt install -y git
git config --global user.email "marius.widmann@gmail.com"
git config --global user.name "canlann"
sudo apt install -y vim
sudo apt install -y keepassxc
sudo apt install -y snapd
sudo snap install -y code --classic
sudo apt install exfat-fuse exfat-utils
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt --fix-broken install
sudo apt install woeusb



# This must be the last installation
sudo apt install -y nautilus-dropbox
dropbox start -i
