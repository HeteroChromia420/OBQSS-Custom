#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-fast install thunar xfce4-terminal firefox-esr xfce4-pulseaudio-plugin xfce4-notifyd xfce4-panel xfce4-weather-plugin xfce4-whiskermenu-plugin desktop-base network-manager network-manager-gnome cantata gimp xscreensaver xserver-xorg-video-intel firmware-amd-graphics fonts-noto* arc-theme kdeconnect papirus-icon-theme breeze-cursor-theme steam caffeine flatpak plank xfce4-power-manager appmenu-gtk2-module appmenu-gtk3-module vala-panel-appmenu vala-panel xfce4-appmenu-plugin -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
mkdir ~/.config/openbox
cp -r openbox_custom/* ~/.config/openbox
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install adriconf
sudo apt-fast install -y openvpn dialog python3-pip python3-setuptools -y --no-install-recommends --no-install-suggests
sudo pip3 install protonvpn-cli
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
wget -qO- https://git.io/papirus-folders-install | sh
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/Modules -n -t string -s "appmenu-gtk-module"
sudo apt purge --auto-remove tint2 cmst pnmixer dunst epiphany-browser
