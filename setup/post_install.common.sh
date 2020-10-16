#!/usr/bin/env zsh

source $HOME/.nvm/nvm.sh # Load NVM to be able to run NPM properly
npm i -g lion-shellscripts
npm i -g eslint npm@latest

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

LION_SHELL="$(npm root -g)/lion-shellscripts"

echo "LION_SHELL='$LION_SHELL'" > $HOME/.zshrc
echo 'source $LION_SHELL/zshconfig.sh' >> $HOME/.zshrc

# Install core vscode extentions
code-insiders --install-extension dbaeumer.vscode-eslint
code-insiders --install-extension EditorConfig.EditorConfig
code-insiders --install-extension mikestead.dotenv
code-insiders --install-extension rebornix.project-snippets
