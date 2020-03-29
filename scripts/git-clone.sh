#!/usr/bin/env bash
set -eu
[[ $# -gt 0 ]] || exit
repo="${@: -1}"
rootdir="${2:-$HOME}"
owner="${GITHUB_LOGIN:-$(whoami)}"
host="${GIT_HOST:-github.com}"
if [[ "$(dirname $repo)" == '.' ]]; then
  repo="$owner/$repo"
else
  owner="$(dirname $repo)"
fi
dir="$HOME/$host/$owner"
url="git@$host:$repo"
mkdir -p $dir
cd $dir
git clone $url
