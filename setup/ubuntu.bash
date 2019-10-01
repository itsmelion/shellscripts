#!/bin/sh

printf "\n\n»  Updating system...\n"
sudo apt update
sudo apt full-upgrade -y

printf "\n\n»  Setting things up\n"
source ./common.sh


sudo apt update
sudo apt install -y \
  build-essential \
  curl \
  wget \
  fonts-firacode \
  apt-transport-https \
  gnupg \
  zsh

# CTOP
echo "\n📦=> Ctop:\n"
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

serverOnly() {
  echo "Installing utils for the server"

  # Install RMate (to edit files remotely on VSCode or else)
  echo "\n📦=> r-mate:\n"
  sudo wget -O /usr/local/bin/rmate https://raw.github.com/aurora/rmate/master/rmate
  sudo chmod a+x /usr/local/bin/rmate
}


# Usefull Desktop apps
installExtras () {
  local yn
  echo "\nDo you wish to install some apps? (Desktop Only)\n"
  echo "\n- Insomnia | GitKraken | VSCode | Spotify .. \n"
  while true; do
    read -p "\n (Y/n) " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) return;;
        * ) echo "\nPlease answer Y or n.";;
    esac
  done

  # Spotify Keys
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

  # Microsoft keys
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

  # Insomnia
  echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
  wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -

  # GitKraken
  wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
  dpkg -i gitkraken-amd64.deb

  sudo apt update
  sudo apt install -y \
    code \
    code-insiders \
    insomnia \
    spotify-client

  sudo update-alternatives --set editor /usr/bin/code
}

# Docker
installDocker () {
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo groupadd docker
  sudo usermod -aG docker $USER
  if [ -d "$HOME/.docker" ]; then
    return;
  else mkdir $HOME/.docker;
  fi
  sudo chmod g+rwx "$HOME/.docker" -R
  sudo systemctl disable docker

  # Docker Compose
  echo "\n📦=> Docker-Compose v1.24.1:\n"
  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

promptDocker () {
  local yn
  while true; do
    read -p "Do you wish to install Docker CE? (Y/n)" yn
    case $yn in
        [Yy]* ) installDocker; break;;
        [Nn]* ) return;;
        * ) echo "Please answer Y or n.";;
    esac
  done
}

promptDocker
installExtras

source ./post_install.common.sh

sudo apt autoremove -y
echo "#######################"
echo "###    FINISHED!    ###"
echo "#######################"

echo "\nif Desktop you may want to disable docker from boot: \n"
echo "    sudo systemctl disable docker"

docker-compose -v
echo "\nyou may check for update docker-compose script: \n"
echo "    https://github.com/docker/compose/releases"
