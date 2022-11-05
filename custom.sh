#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install caffeine breeze-cursor-theme wget fonts-noto* kdeconnect plank zram-tools -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
mkdir ~/.config/openbox
cp -r config/* ~/.config/
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt install -y openvpn network-manager-openvpn-gnome -y --no-install-recommends --no-install-suggests
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo apt purge --auto-remove dunst tint2 pnmixer celluloid quodlibet gimp mpv youtube-dl epiphany-browser libreoffice 
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
git clone https://github.com/dglava/arc-openbox
cp -r arc-openbox/* ~/.themes
rm -rf arc-openbox
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh
clear
read -n 1 -s -r -p "Press any key to continue..."
