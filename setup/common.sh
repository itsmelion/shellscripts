sshSetup () {
  printf "\n»  SSH setup\n"

  if [ -d "$HOME/.ssh" ]; then
    printf "You already have a .ssh folder\n"
    return;
  fi

  mkdir -m 700 $HOME/.ssh

  read -p "Enter your git access token: " GIT_TOKEN
  cd $HOME/.ssh
  curl -H 'Authorization: token $(GIT_TOKEN)' -H 'Accept: application/vnd.github.v4.raw' -O -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa
  curl -H 'Authorization: token $(GIT_TOKEN)' -H 'Accept: application/vnd.github.v4.raw' -O -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa.pub
  curl -H 'Authorization: token $(GIT_TOKEN)' -H 'Accept: application/vnd.github.v4.raw' -O -fsSL https://api.github.com/repos/itsmelion/keychain/contents/ssh/known_hosts
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

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cat ../.zshconfig >> $HOME/.zshrc

sshSetup
gitSetup

printf "\n\n»  Installing nice apps..\n"

# Node NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

while true; do
    read -p "Do you wish to install Docker CE? (yes/no)" local yn
    case $yn in
        [Yy]* ) installDocker; break;;
        [Nn]* ) return;;
        * ) echo "Please answer yes or no.";;
    esac
done

xdg-mime default code.desktop text/plain

cp ../.editorconfig $HOME

if [ -d "$HOME/sites" ]; then
  return;
else mkdir $HOME/sites;
fi