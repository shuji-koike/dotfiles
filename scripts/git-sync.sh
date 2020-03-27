#!/usr/bin/env bash -e
GIT_DIR="${GIT_DIR:-$1}"
if ! [[ -d $GIT_DIR ]]; then
  "$(dirname $0)/git-list-repo.sh" | parallel $0 {}
  exit
fi
echo '~/'$(realpath --relative-to="$HOME" $GIT_DIR)
git -C $GIT_DIR fetch --all --prune
git -C $GIT_DIR branch
