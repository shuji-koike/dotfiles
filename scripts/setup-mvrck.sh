#!/usr/bin/env bash

# https://brew.sh/#install
/usr/bin/ruby -e "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install java8

brew cask install docker

brew cask install google-chrome
brew cask install slack
brew cask install visual-studio-code
brew cask install intellij-idea-ce

brew install openssh vim emacs

brew install sbt
brew install stack
brew install go

mkdir -p ~/mvrck-inc
