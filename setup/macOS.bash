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
brew cask install visual-studio-code-insiders
brew cask install insomnia
brew cask install gitkraken

# Browsers
brew cask install google-chrome-canary
brew cask install firefox-developer-edition
brew cask install safari-technology-preview

brew cask install slack
brew cask install skype-preview
brew cask install spotify
npm i -g typescript eslint

echo 'fine.. now install Docker, Photoshop, WhatsApp and Trello Spark.. then you are ready'
