#!/usr/bin/env zsh

source $HOME/.nvm/nvm.sh # Load NVM to be able to run NPM properly
npm i -g lion-shellscripts
npm i -g eslint npm@latest

LION_SHELL="$(npm root -g)/lion-shellscripts"

echo "LION_SHELL='$LION_SHELL'" > $HOME/.zshrc
echo 'source $LION_SHELL/zshconfig.sh' >> $HOME/.zshrc

# Install core vscode extentions
code-insiders --install-extension dbaeumer.vscode-eslint
code-insiders --install-extension EditorConfig.EditorConfig
code-insiders --install-extension mikestead.dotenv
code-insiders --install-extension rebornix.project-snippets
code-insiders --install-extension Shan.code-settings-sync
code-insiders --install-extension shinnn.stylelint
