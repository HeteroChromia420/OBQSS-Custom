#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-fast install ffmpegthumbnailer fonts-noto* kdeconnect steam caffeine flatpak plank zram-tools -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
mkdir ~/.config/openbox
cp -r openbox_custom/* ~/.config/openbox
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt-fast install -y openvpn network-manager-openvpn-gnome -y --no-install-recommends --no-install-suggests
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo apt purge --auto-remove epiphany-browser
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
clear
echo "don't forget to read zswap-help for details on improving swap support on your machine."
read -n 1 -s -r -p "Press any key to continue..."
