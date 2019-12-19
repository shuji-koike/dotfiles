# linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
  export PATH="/home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/vendor/portable-ruby/current/bin:$PATH"
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

# rbenv
if [ -d ${HOME}/.rbenv ]; then
  eval "$(rbenv init -)"
fi

# pyenv
if [ -d ${HOME}/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# go
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
elif [ -d "/usr/local/opt/go" ]; then
  export GOPATH="/usr/local/opt/go"
fi
if ! [ -z $GOPATH ]; then
  export PATH="$GOPATH/bin:$PATH"
fi

# java
if [ -e "/usr/libexec/java_home" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v "1.8")
  export PATH=${JAVA_HOME}/bin:${PATH}
fi

# jenv
if [ -d "/usr/local/opt/jenv" ]; then
  export JENV_ROOT=/usr/local/opt/jenv
  eval "$(jenv init -)"
fi

# Heroku
if [ -d /usr/local/heroku/bin/ ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# Docker
command -v docker-machine >/dev/null 2>&1 && eval $(docker-machine env 2>/dev/null)

# hadoop
if [ -d "/usr/local/opt/hadoop" ]; then
  export HADOOP_HOME="/usr/local/opt/hadoop/libexec"
  export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
fi

# node_modules
if [ -d ${HOME}/node_modules/.bin ]; then
  export PATH="$PATH:${HOME}/node_modules/.bin"
fi

# N
if [ -d ${HOME}/.n ]; then
  export N_PREFIX=${HOME}/.n
fi

# ${HOME}/bin
if [ -d ${HOME}/bin ]; then
  export PATH="${HOME}/bin:$PATH"
fi
