# autoload
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz vcs_info

# PATH
if [ -e /etc/profile ]; then
  export PATH="/usr/bin:/bin"
  . /etc/profile
fi
export PATH="/usr/local/sbin:$PATH"

if [ -d "$HOME/github.com" ]; then
  export CDPATH="$HOME/github.com"
fi

# fpath
if [ -d "/usr/local/share/zsh/site-functions" ]; then
  fpath=("/usr/local/share/zsh/site-functions" $fpath)
fi
if [ -d "/usr/local/share/zsh-completions" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
if [ -d "${HOME}/.zsh/zsh-completions" ]; then
  fpath=("${HOME}/.zsh/zsh-completions" $fpath)
fi

# include
. ~/.zsh/alias.zsh
. ~/.zsh/prompt.zsh
. ~/.zsh/env.zsh
. ~/.zsh/misc.zsh
. ~/.zsh/docker.zsh
. ~/.zsh/kubectl.zsh
. ~/.zsh/gcloud.zsh
. ~/.zsh/ruby.zsh
. ~/.zsh/node.zsh

# override with zshrc.local
if [ -e ~/.zshrc.local ] ; then
  . ~/.zshrc.local
fi
