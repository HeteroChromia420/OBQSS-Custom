#! /bin/bash

clear

# in this sh file, there's just a bunch of packages that i personally use.
sudo apt install wget unzip nitrogen dunst xfce4-whiskermenu-plugin xfce4-appmenu-plugin vala-panel-appmenu appmenu* caffeine breeze-cursor-theme wget fonts-noto* kdeconnect plank zram-tools -y --no-install-recommends --no-install-suggests 
rm -rf ~/.config/openbox/*
mkdir ~/.config/openbox
cp -r config/* ~/.config/
cp gtkrc-2.0 ~/.gtkrc-2.0
mkdir ~/.local/share/themes
mkdir ~/.themes
mkdir ~/.icons
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install -y openvpn network-manager-openvpn-gnome -y --no-install-recommends --no-install-suggests
sudo apt update
sudo cp 50-mouse-acceleration.conf /usr/share/X11/xorg.conf.d/
sudo apt purge --auto-remove xfce4-notifyd tint2 pnmixer celluloid quodlibet gimp mpv youtube-dl epiphany-browser libreoffice gnome-software
sudo cp 69-sysctl-performance.conf /etc/sysctl.d/
wget -qO- https://git.io/papirus-folders-install | sh
sudo papirus-folders -C violet
xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true
xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true
sudo cp 52appmenu-gtk-module_add-to-gtk-modules /etc/X11/Xsession.d
sudo cp -r wallpapers /home/
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip
mv gtk-master Dracula
cp -r Dracula ~/.local/share/themes
mv Dracula ~/.themes
git clone https://github.com/dracula/openbox
cp -r openbox/Dracula-withoutBorder/openbox-3 ~/.local/share/themes/Dracula/
mv openbox/Dracula-withoutBorder/openbox-3 ~/.themes/Dracula/
git clone https://github.com/catppuccin/cursors.git
unzip cursors/cursors/Catppuccin-Mocha-Mauve-Cursors.zip
cp -r Catppuccin-Mocha-Mauve-Cursors/ ~/.local/share/icons
mv Catppuccin-Mocha-Mauve-Cursors/ ~/.icons/
git clone https://github.com/dracula/plank.git
mv plank/Dracula/ ~/.local/share/plank/themes/
clear
read -n 1 -s -r -p "Press any key to continue..."
