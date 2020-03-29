#!/usr/bin/env bash -ex

# cd ~/.dotfiles
# git fetch
# git checkout origin/master

if [ -x "$(command -v dpkg)" ]; then
  apt update
  apt upgrade
fi

if [ -x "$(command -v yum)" ]; then
  yum -y update
  package-cleanup --oldkernels --count=1
fi

if [ -x "$(command -v brew)" ]; then
  brew update
  brew upgrade
  brew cask upgrade
  brew cleanup
  brew doctor
fi

if [ -x "$(command -v docker)" ]; then
  docker images --format "{{.Repository}}:{{.Tag}}" |
    grep -v ":<none>"  |
    grep -v "/" |
    xargs -n1 docker pull
fi
