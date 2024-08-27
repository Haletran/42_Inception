#!bin/sh

sudo pacman -S ssh samba git make cmake --noconfirm
echo "Installing yay"
sudo pacman -S --needed git base-devel --noconfirm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm