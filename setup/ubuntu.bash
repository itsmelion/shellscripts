printf "»  Updating system..."
sudo apt update
sudo apt full-upgrade -y

printf "»  Setting things up"
source common.sh

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt update
sudo apt install -y build-essential fonts-firacode apt-transport-https nodejs

install-extras () {
  # Spotify Keys
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

  # Microsoft keys
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

  # GitKraken
  wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
  dpkg -i gitkraken-amd64.deb

  sudo apt update
  sudo apt install -y code code-insiders spotify-client
}

sudo update-alternatives --set editor /usr/bin/code

while true; do
    read -p "Do you wish to install apps and extras?" yn
    case $yn in
        [Yy]* ) install-extras; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo apt autoremove -y
