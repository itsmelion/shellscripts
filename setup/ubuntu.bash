echo "»  Updating system..."
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove

echo "»  OK"
echo "»  Setting things up"
source common.sh
