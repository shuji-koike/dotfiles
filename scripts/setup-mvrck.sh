#!/usr/bin/env bash

# softwareupdate -ia

# sudo scutil --set HostName mvdt018
# sudo scutil --set LocalHostName mvdt018
# sudo scutil --set ComputerName mvdt018
# dscacheutil -flushcache

xcode-select --install

# https://brew.sh/#install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew cask install java8
brew tap adoptopenjdk/openjdk
brew cask install adoptopenjdk8

brew cask install docker

brew cask install google-chrome
brew cask install slack
brew cask install visual-studio-code
brew cask install intellij-idea-ce

brew install openssh git vim emacs

brew install sbt scala
brew install stack
brew install go
brew install node
brew install yarn
brew install rbenv

mkdir -p ~/github.com/mvrck-inc
