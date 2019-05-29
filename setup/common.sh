echo "»  SSH setup"

if [ -d "$HOME/.ssh" ]; then
  printf "You already have a .ssh folder\n"
  exit
fi

mkdir -m 700 $HOME/.ssh
read -p "Enter your git access token: " GIT_TOKEN
cd $HOME/.ssh
curl -H 'Authorization: token $(GIT_TOKEN)' -H 'Accept: application/vnd.github.v4.raw' -O -L https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa
curl -H 'Authorization: token $(GIT_TOKEN)' -H 'Accept: application/vnd.github.v4.raw' -O -L https://api.github.com/repos/itsmelion/keychain/contents/ssh/id_rsa.pub
curl -H 'Authorization: token $(GIT_TOKEN)' -H 'Accept: application/vnd.github.v4.raw' -O -L https://api.github.com/repos/itsmelion/keychain/contents/ssh/known_hosts
chmod 644 id_rsa.pub
chmod 600 id_rsa
cd $HOME
printf "»  SSH setup Complete\n"

printf "»  Installing nice apps.."
# Node NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ../.zshconfig $HOME/.zshrc

xdg-mime default code.desktop text/plain
