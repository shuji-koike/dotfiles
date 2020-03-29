#!/usr/bin/env bash

set -ex

# softwareupdate -ia

if [ -n $HOST_NAME ]; then
  echo $HOST_NAME
  # sudo scutil --set HostName $HOST_NAME
  # sudo scutil --set LocalHostName $HOST_NAME
  # sudo scutil --set ComputerName $HOST_NAME
  # dscacheutil -flushcache
fi

xcode-select --install

# https://brew.sh/#install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
