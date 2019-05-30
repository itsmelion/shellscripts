## Installation

clone at your `$HOME` and add each script file on your `~/.zshrc` file
ex:
```sh
if grep -q Microsoft /proc/version; then
  echo "Detected you are using WSL(Linux) on Windows, setting up your shell..."
  export WINDOWS=/mnt/c/Users/Lion
  source $WINDOWS/scripts/aliases.sh
else
  source $HOME/scripts/zshconfig.sh
  source $HOME/scripts/aliases.sh
fi
```
___
It works best with ZSH + OhMyZsh

## OS Setup script
*IMPORTANT:* Make sure that you have a GIT_TOKEN key in your shell, else get one, and change the repo URL.
RUN: `setup/[OS].bash`
