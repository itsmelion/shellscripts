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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
