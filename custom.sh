#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo apt install xfce4-whiskermenu-plugin xfce4-appmenu-plugin vala-panel-appmenu appmenu* caffeine breeze-cursor-theme wget fonts-noto* kdeconnect plank zram-tools -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
mkdir ~/.config/openbox
cp -r config/* ~/.config/
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install -y openvpn network-manager-openvpn-gnome -y --no-install-recommends --no-install-suggests
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo apt purge --auto-remove dunst tint2 pnmixer celluloid quodlibet gimp mpv youtube-dl epiphany-browser libreoffice 
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
wget -qO- https://git.io/papirus-folders-install | sh
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
sudo cp 52appmenu-gtk-module_add-to-gtk-modules /etc/X11/Xsession.d
clear
read -n 1 -s -r -p "Press any key to continue..."
