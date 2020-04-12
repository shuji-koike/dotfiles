#!/bin/zsh
curl -sfLo $(dirname ${0})/zsh-completions/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
curl -sfLo $(dirname ${0})/zsh-completions/_yarn https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/yarn/_yarn
chmod 0700 $(dirname ${0})/zsh-completions/_*
ls -la $(dirname ${0})/zsh-completions/
