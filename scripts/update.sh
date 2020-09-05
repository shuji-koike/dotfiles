#!/usr/bin/env bash

set -ex

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

if [ -x "$(command -v docker)" -a -S /var/run/docker.sock ]; then
  docker images --format "{{.Repository}}:{{.Tag}}" |
    grep -v ":<none>"  |
    grep -v "/" |
    xargs -n1 docker pull
  docker system prune -f
fi
