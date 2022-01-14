#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-fast install xfce4-appmenu-plugin vala-panel-appmenu appmenu* firefox-esr ffmpegthumbnailer xfce4-notifyd xfce4-weather-plugin cantata gimp xscreensaver xserver-xorg-video-intel fonts-noto* kdeconnect steam caffeine flatpak plank -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
rm -rf ~/.config/xfce4
mkdir ~/.config/openbox
cp -r openbox_custom/* ~/.config/openbox
cp -r xfce4 ~/.config
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt-fast install -y openvpn network-manager-openvpn-gnome -y --no-install-recommends --no-install-suggests
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo apt purge --auto-remove epiphany-browser
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
sudo cp 52appmenu-gtk-module_add-to-gtk-modules /etc/X11/Xsession.d
clear
echo "don't forget to read zswap-help for details on improving swap support on your machine."
read -n 1 -s -r -p "Press any key to continue..."
