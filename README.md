## Installation

clone at your `$HOME` and add each script file on your `~/.zshrc` file
ex:
```shell
if grep -q Microsoft /proc/version; then
  echo "Detected you are using WSL(Linux) on Windows, setting up your shell..."
  export WINDOWS=/mnt/c/Users/Lion
  source $WINDOWS/scripts/aliases.sh
else
  source $HOME/scripts/zshconfig.sh
  source $HOME/scripts/aliases.sh
fi
```

## OS Setup script
RUN: `setup/[OS].bash`

### Cloning with SSH?
get started with this utility:
```shell
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
```
