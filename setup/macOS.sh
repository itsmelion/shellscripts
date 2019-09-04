#!/bin/sh

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# xcode command line - Select: "Get xcode" and go get a coffee (preferably far from your desk :)
xcode-select --install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install zsh
brew install zsh-completions
brew install wget
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew update
brew upgrade

source ./common.sh

# Development Tools
brew cask install iterm2-beta
brew install node
brew install gnupg
brew install watchman
brew install ctop
brew cask install docker-edge
brew cask install visual-studio-code-insiders
brew cask install insomnia
brew cask install gitkraken
brew cask install sketch

# Browsers
brew cask install google-chrome-canary
brew cask install firefox-developer-edition
brew cask install safari-technology-preview

brew cask install slack-beta
brew cask install skype-preview
brew cask install spotify
brew cask install font-fira-code

npm i -g eslint npm@latest

curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh

source ./post_install.common.sh

echo 'fine.. now install Docker, Photoshop, WhatsApp and Trello Spark.. then you are ready'
echo 'optional JDK8 (for native)'
echo 'brew tap AdoptOpenJDK/openjdk'
echo 'brew cask install adoptopenjdk8'
