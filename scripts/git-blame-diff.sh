#!/usr/bin/env bash
set -e
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
rev=${1:-'HEAD~1'}
git diff -U0 $rev | \
while read line; do
  if echo $line | grep -oP '^--- a/(\K.*)' ; then
    echo "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/"
    file=$(echo $line | grep -oP '^--- a/(\K.*)')
  fi
  IFS=',' read -ra arr <<< $(echo $line | grep -oP '^@@ -(\K\d+)(,(\d+))?')
  if [ ${#arr[@]} -eq 2 ]; then
    git blame -c -L"${arr[0]},+${arr[1]}" "$file" $rev
  elif [ ${#arr[@]} -eq 1 ]; then
    git blame -c -L$"${arr[0]},+1" "$file" $rev
  fi
done
