#!/usr/bin/env zsh

source $HOME/.nvm/nvm.sh # Load NVM to be able to run NPM properly
git -C=$HOME clone git@github.com:itsmelion/shellscripts.git shellscripts
LION_SHELL="$HOME/shellscripts"

echo "export LION_SHELL='$LION_SHELL'" > $HOME/.zshrc
echo 'source $LION_SHELL/zshconfig.sh' >> $HOME/.zshrc

npm i -g yarn-deduplicate
# Install core vscode extentions
code --install-extension dbaeumer.vscode-eslint
code --install-extension EditorConfig.EditorConfig
code --install-extension mikestead.dotenv
code --install-extension rebornix.project-snippets
