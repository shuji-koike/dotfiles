#!/usr/bin/env bash
set  -e
rootdir="${1:-$HOME/github.com}"
find $rootdir -maxdepth 3 -type d -name '.git' | while read line; do
  line="$(dirname $line)"
  [[ -d $line ]] && echo $line
done
