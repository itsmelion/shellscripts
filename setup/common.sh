#!/bin/sh

sshSetup () {
  echo "\n»  SSH setup\n"
  local yn

  if [ -d "$HOME/.ssh" ]; then
    echo "You already have a .ssh folder\n"
    while true; do
      read -p "shall we overwrite it? (Y/n) " yn
      case $yn in
          [Yy]* ) echo "\n... overwriting: id_rsa, id_rsa.pub, known_hosts\n"; break;;
          [Nn]* ) return;;
          * ) echo "Please answer Y or n.\n";;
      esac
    done
  else mkdir -m 700 $HOME/.ssh;
  fi

  if [ -z $GIT_TOKEN ]; then
    local GIT_TOKEN
    read -p "\nEnter your git access token: " GIT_TOKEN
  fi

  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -O "$HOME/.ssh/id_rsa" -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa
  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -O "$HOME/.ssh/id_rsa.pub" -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa.pub
  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -O "$HOME/.ssh/known_hosts" -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/known_hosts

  chmod 644 $HOME/.ssh/id_rsa.pub
  chmod 600 $HOME/.ssh/id_rsa

  echo "\n»  SSH setup Complete\n"
}

# Git Setup
gitSetup () {
  cp $(dirname "$1")/git/.gitconfig $HOME
  git config --global user.name "Christhopher Lion"
  git config --global user.email christhopherleao@icloud.com
  git config --global core.editor code
  cp $(dirname "$1")/git/.gitignore $HOME
  git config --global core.excludesfile $HOME/.gitignore
}

shellSecrets() {
  local GIT_TOKEN
  read -p "\nEnter your git access token: " GIT_TOKEN

  curl -H "Authorization: token $GIT_TOKEN" -H 'Accept: application/vnd.github.v4.raw' -fsSL https://api.github.com/repos/itsmelion/keychain/contents/shell.sh > $HOME/.secrets.sh
}


# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

gitSetup
shellSecrets
sshSetup

echo "\n\n»  Installing nice apps..\n"

# Node NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.1/install.sh | bash

xdg-mime default code.desktop text/plain

cp $(dirname "$1")/.editorconfig $HOME
