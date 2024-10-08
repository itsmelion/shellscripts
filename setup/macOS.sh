# normal minimum is 15 (225 ms)
defaults write -g InitialKeyRepeat -int 500

# normal minimum is 2 (30 ms)
defaults write -g KeyRepeat -int 50

# xcode command line - Select: "Get xcode" and go get a coffee (preferably far from your desk :)
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install wget
brew install coreutils
brew update
brew upgrade

source ./setup/common.sh

# Development Tools
# brew install iterm2
brew install --cask iterm2
# brew install node (now we use corepack and NVM)
brew install git
brew install watchman
brew install ctop
brew install rmate
# brew install yarn (now we use corepack and NVM)
brew install zsh-syntax-highlighting
# MAS = Mac App Store Command Line
brew install mas
# not using cocoapods from brew because dont have option for the Beta version
# brew install cocoapods
brew install gpg-suite-no-mail
brew install docker-edge
brew install visual-studio-code
brew install insomnia
brew install gitkraken
brew install sketch

# Browsers
brew install google-chrome
# brew install google-chrome-canary
# brew install safari-technology-preview
# brew install firefox-developer-edition

brew install java
brew install flutter
brew install android-studio

brew install font-fira-code
brew install slack-beta
brew install spotify
# brew install steam
# brew install battle-net
# brew install skype-preview
# brew install font-hack-nerd-font
# brew install font-monoid-nerd-font
# brew install font-mononoki-nerd-font
# brew install font-overpass-nerd-font

# JDK (for RNative)
# brew install adoptopenjdk/openjdk/adoptopenjdk8

source ./setup/post_install.common.sh

gem update --user
gem install --user cocoapods --pre

echo 'fine.. now install Docker, Photoshop, WhatsApp and Trello Spark.. then you are ready'
echo 'optional JDK (for native)'
