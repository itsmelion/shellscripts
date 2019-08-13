#!/bin/bash

# xcode command line - Select: "Get xcode" and go get a coffee (preferably far from your desk :)
xcode-select --install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install zsh
brew install zsh-completions
brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions
brew update
brew upgrade
brew install wget

source ./common.sh

# Development Tools
brew cask install iterm2-beta
brew install node
brew install watchman
brew install docker
brew cask install visual-studio-code-insiders
brew cask install insomnia
brew cask install gitkraken
brew cask install sketch

# Browsers
brew cask install google-chrome-canary
brew cask install firefox-developer-edition
brew cask install safari-technology-preview

brew cask install slack
brew cask install skype-preview
brew cask install spotify
npm i -g eslint react-native-cli

brew tap homebrew/cask-fonts
brew cask install font-fira-code

curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | zsh

echo 'fine.. now install Docker, Photoshop, WhatsApp and Trello Spark.. then you are ready'
echo optional JDK8 (for native) 
echo brew tap AdoptOpenJDK/openjdk
echo brew cask install adoptopenjdk8