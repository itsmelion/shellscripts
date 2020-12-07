#!/bin/sh

printf "»  Updating system"
sudo pacman -Syu

printf "»  installing core packages..."
sudo pacman -Sy curl wget openssh git base-devel yajl yay nano docker docker-compose

printf "»  Setting things up"
source ./common.sh

sudo pacman -S \
otf-fira-code \
chrome-gnome-shell \
guake \
nodejs \
npm \
yarn \
zsh \
noto-fonts-emoji ttf-joypixels ttf-twemoji-color \
gnupg

printf "»  About to install (AUR) packages"
yay visual-studio-code-bin --noconfirm
yay visual-studio-code-insiders-bin --noconfirm
yay gitkraken --noconfirm
yay insomnia --noconfirm
yay spotify --noconfirm
yay ctop --noconfirm
yay opensiddur-hebrew-fonts --noconfirm
yay ttf-mac-fonts --noconfirm

source ./post_install.common.sh
