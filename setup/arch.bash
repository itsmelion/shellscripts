printf "»  Updating system"
sudo pacman -Syu

printf "»  installing core packages..."
sudo pacman -Sy curl wget openssh git base-devel yajl yaourt nano

printf "»  Setting things up"
source common.sh

pacman -S otf-fira-code guake code nodejs npm xdg-mime zsh

yaourt -S gitkraken insomnia spotify
