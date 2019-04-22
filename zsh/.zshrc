# export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/libexec:$PATH"

if [ -e /etc/profile ] ; then
  . /etc/profile
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

# override with zshrc.local
if [ -e ~/.zshrc.local ] ; then
  . ~/.zshrc.local
fi
