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
brew install gpg-suite-no-mail
brew install watchman
brew install ctop
brew install rmate
brew install yarn
# brew install fish
# brew install cocoapods
brew install cocoapods
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

source ./post_install.common.sh

gem update --user-install
gem install --user-install cocoapods --pre

echo 'fine.. now install Docker, Photoshop, WhatsApp and Trello Spark.. then you are ready'
echo 'optional JDK8 (for native)'
echo 'brew cask install java'
