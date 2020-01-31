#!/usr/bin/env bash

# softwareupdate -ia

# sudo scutil --set HostName mvdt018
# sudo scutil --set LocalHostName mvdt018
# sudo scutil --set ComputerName mvdt018
# dscacheutil -flushcache

xcode-select --install

# https://brew.sh/#install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/services

brew cask install adoptopenjdk8

brew cask install docker
brew cask install kitematic

brew cask install google-chrome
brew cask install slack
brew cask install visual-studio-code
brew cask install intellij-idea-ce

brew install openssh
brew install git tig
brew install coreutils
brew install vim emacs

brew install sbt scala
brew install stack
brew install go
brew install node node@8
brew install yarn
brew install rbenv

brew install mysql@5.7
brew install redis

mkdir -p ~/github.com/mvrck-inc

export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

stack build mysql \
  --extra-lib-dirs=/usr/local/opt/openssl/lib \
  --extra-include-dirs=/usr/local/opt/openssl/include

brew install pcre
brew install freetds
brew pull https://github.com/Homebrew/homebrew-core/pull/31858
brew install --force clickhouse-odbc
