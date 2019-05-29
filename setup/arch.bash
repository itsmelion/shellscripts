echo "»  Updating system"
sudo pacman -Syu

echo "»  installing core packages..."
sudo pacman -Sy curl wget openssh git nano

echo "»  OK"
echo "»  Setting things up"
source common.sh
