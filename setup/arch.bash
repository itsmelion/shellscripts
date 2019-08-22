#!/bin/sh

printf "»  Updating system"
sudo pacman -Syu

printf "»  installing core packages..."
sudo pacman -Sy curl wget openssh git base-devel yajl yay nano docker

printf "»  Setting things up"
source ./common.sh

sudo pacman -S otf-fira-code chrome-gnome-shell guake nodejs npm yarn zsh noto-fonts-emoji ttf-joypixels ttf-twemoji-color

printf "»  About to install (AUR) gitkraken insomnia spotify"
yay visual-studio-code-bin
yay visual-studio-code-insiders-bin
yay gitkraken
yay insomnia
yay spotify
yay ctop
yay opensiddur-hebrew-fonts
yay ttf-mac-fonts
