#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install synaptic xfce4-panel xfce4-pulseaudio-plugin xfce4-whiskermenu-plugin firefox-esr desktop-base gmrun xfce4-screenshooter caffeine xscreensaver xfce4-notifyd xfce4-power-manager package-update-indicator arc-theme breeze-cursor-theme picom wget ffmpegthumbnailer fonts-noto* kdeconnect steam caffeine flatpak plank zram-tools -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
mkdir ~/.config/openbox
cp -r config/* ~/.config/
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt install -y openvpn network-manager-openvpn-gnome -y --no-install-recommends --no-install-suggests
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo apt purge --auto-remove epiphany-browser dunst tint2 pnmixer 
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
git clone https://github.com/dglava/arc-openbox
cp -r arc-openbox/* ~/.themes
rm -rf arc-openbox
wget -qO- https://git.io/papirus-icon-theme-install | sh
wget -qO- https://git.io/papirus-folders-install | sh
clear
read -n 1 -s -r -p "Press any key to continue..."
