#!/bin/sh
# normal minimum is 15 (225 ms)
defaults write -g InitialKeyRepeat -int 500

# normal minimum is 2 (30 ms)
defaults write -g KeyRepeat -int 50

# xcode command line - Select: "Get xcode" and go get a coffee (preferably far from your desk :)
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install wget
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew update
brew upgrade

source ./setup/common.sh

# Development Tools
brew cask install iterm2-beta
brew install node
brew install watchman
brew install ctop
brew install rmate
brew install yarn
brew install zsh-syntax-highlighting
# not using cocoapods from brew because dont have option for the Beta version
# brew install cocoapods
brew cask install gpg-suite-no-mail
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

source ./setup/post_install.common.sh

gem update --user-install
gem install --user-install cocoapods --pre

echo 'fine.. now install Docker, Photoshop, WhatsApp and Trello Spark.. then you are ready'
echo 'optional JDK (for native)'
