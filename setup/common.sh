#!/bin/sh

sshSetup () {
  printf "\n»  SSH setup\n"
  local yn GIT_TOKEN

  if [ -d "$HOME/.ssh" ]; then
    printf "You already have a .ssh folder\n"
    while true; do
      read -p "shall we overwrite it? (Y/n) " yn
      case $yn in
          [Yy]* ) printf "\n... overwriting: id_rsa, id_rsa.pub, known_hosts\n"; break;;
          [Nn]* ) return;;
          * ) printf "Please answer Y or n.\n";;
      esac
    done
  else mkdir -m 700 $HOME/.ssh;
  fi

  cd $HOME/.ssh
  read -p "\nEnter your git access token: " GIT_TOKEN
  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -O -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa
  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -O -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa.pub
  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -O -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/known_hosts
  chmod 644 id_rsa.pub
  chmod 600 id_rsa
  cd $HOME
  printf "\n»  SSH setup Complete\n"
}

# Git Setup
gitSetup () {
  cp ../git/.gitconfig $HOME
  git config --global user.name "Christhopher Lion"
  git config --global user.email christhopherleao@icloud.com
  git config --global core.editor code
  cp ../git/.gitignore $HOME
  git config --global core.excludesfile $HOME/.gitignore
}

# Docker
installDocker () {
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo groupadd docker
  sudo usermod -aG docker $USER
  sudo chmod g+rwx "$HOME/.docker" -R
  sudo systemctl disable docker
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

cd "$(dirname "$0")"

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cat ../zshconfig.sh >> $HOME/.zshrc

sshSetup
gitSetup

printf "\n\n»  Installing nice apps..\n"

# Node NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

promptDocker

xdg-mime default code.desktop text/plain

cp ../.editorconfig $HOME
cp ../zshconfig.sh $HOME/.zshrc

if [ -d "$HOME/sites" ]; then
  return;
else mkdir $HOME/sites;
fi
