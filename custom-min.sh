#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-fast install firefox-esr ffmpegthumbnailer xfce4-pulseaudio-plugin xfce4-notifyd xfce4-panel xfce4-weather-plugin xfce4-whiskermenu-plugin desktop-base network-manager network-manager-gnome cantata gimp xscreensaver xserver-xorg-video-intel fonts-noto* arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme steam caffeine flatpak plank xfce4-power-manager -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
mkdir ~/.config/openbox
cp -r openbox_custom/* ~/.config/openbox
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt-fast install -y openvpn network-manager-openvpn-gnome -y --no-install-recommends --no-install-suggests
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo apt purge --auto-remove tint2 cmst pnmixer dunst epiphany-browser
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
git clone https://github.com/dglava/arc-openbox
mkdir
cp -r arc-openbox/* ~/.themes
rm -rf arc-openbox
