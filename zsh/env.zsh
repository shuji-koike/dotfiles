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
if [ -d "/usr/local/opt/go" ]; then
  export GOPATH="/usr/local/opt/go"
fi
if ! [ -z $GOPATH ]; then
  export PATH="$GOPATH/bin:$PATH"
fi

# java
if [ -e "/usr/libexec/java_home" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v "1.8")
  export PATH=${JAVA_HOME}/bin:${PATH}
  export SBT_OPTS="$JAVA_OPTS"
  export PLAY_OPTS="$JAVA_OPTS"
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

# gcp
if [ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin ]; then
  export PATH="$PATH:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin"
fi

# hadoop
if [ -d "/usr/local/opt/hadoop" ]; then
  export HADOOP_HOME="/usr/local/opt/hadoop/libexec"
  export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
fi

# linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
  function brew { su - linuxbrew -c "brew $1 $2 $3 $4" }
  # export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
  # export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

# node_modules
if [ -d ${HOME}/node_modules/.bin ]; then
  export PATH="$PATH:${HOME}/node_modules/.bin"
fi

# N
if [ -d ${HOME}/.n ]; then
  export N_PREFIX=${HOME}/.n
fi
