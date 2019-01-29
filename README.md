## Installation

clone at your `$HOME` and add each script file on your `~/.zshrc` file
ex:
```sh
if grep -q Microsoft /proc/version; then
  echo "OK you are using WSL on Windows"
  export WINDOWS=/mnt/c/Users/Lion
  source $WINDOWS/scripts/aliases.sh
else
  source $HOME/scripts/zshconfig.sh
  source $HOME/scripts/aliases.sh
fi
```
___
It works with ZSH + OhMyZsh
