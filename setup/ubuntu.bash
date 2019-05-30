printf "»  Updating system..."
sudo apt update
sudo apt full-upgrade -y

printf "»  Setting things up"
source common.sh

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt update
sudo apt install -y build-essential curl wget fonts-firacode apt-transport-https nodejs

installExtras () {
  # Spotify Keys
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

  # Microsoft keys
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

  # Insomnia
  echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
  wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

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

while true; do
    read -p "Do you wish to install apps and extras? (yes/no)" local yn
    case $yn in
        [Yy]* ) installExtras; break;;
        [Nn]* ) return;;
        * ) echo "Please answer yes or no.";;
    esac
done

sudo apt autoremove -y
