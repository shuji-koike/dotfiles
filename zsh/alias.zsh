alias -g G='| grep '
alias -g M='| more '
alias tmux='tmux -u'

if [ -e /usr/local/bin/exa ]; then
  alias ls="exa --group --group-directories-first --header --git"
elif [ 'Darwin' = $(uname -s) ]; then
  alias ls='ls -FG'   # Mac
else
  alias ls='ls -Fv --color'  # Linux
fi
alias ll='ls -lh'
alias la='ls -lah'
alias lR='ls -lahR'

alias a=atom
alias b=brew
alias c='code .'
alias d=docker
# alias e=
alias f='git fetch'
alias g=git
alias h='fc -rl -10000 | peco'
# alias i=
# alias j=
alias k=kubectl
alias l=less
alias m='git checkout origin/HEAD'
alias n=npm
alias o=open
alias p=pbpaste
# alias q=q
# alias r=r # is a shell builtin
alias s=ssh
alias t='tig --all'
# alias u=
alias v='vim'
# alias w=w
# alias x=
alias y=yarn
alias z='. ~/.zshrc && . ~/.zshrc.local'

alias aa='git --no-pager diff; git add . && git commit --amend -a --no-edit'
alias aap='aa && git push -f'
alias add='git add'
alias co='git checkout'
alias st='git status'
alias ff='git fetch && git checkout origin/HEAD'
alias dff='git diff'
alias dfff='git difftool'
alias dffff='git difftool origin/$(git rev-parse --abbrev-ref HEAD) HEAD'
alias fetch='git fetch'
alias fixup='git commit -a --fixup'
alias push='git push'
alias pull='git pull'
alias wip='git add . && git commit -a --no-verify -m "fixup! [ci skip] WIP WIP WIP WIP WIP"'
alias branch-clean='git branch --merged origin/HEAD | grep -v master | xargs -n1 git branch -D'
alias stash='git stash -u'
alias pop='git stash pop'
alias stage='git push -f origin HEAD:staging'
alias clone='git-clone.sh'

alias gg='github'

alias rx='rbenv exec'
alias bx='bundle exec'
alias nx='npx nodemon -x'

alias bi='brew install'
alias bl='brew leaves'
alias sl='brew services list'
alias run='brew services run'
alias start='brew services start'
alias stop='brew services stop'
alias restart='brew services restart'
alias upgrade='brew update && brew upgrade && brew cask upgrade && brew cleanup && brew doctor'
alias cask='brew cask'

if [ -e /bin/systemctl ]; then
  alias sl='sudo systemctl'
  alias start='sudo systemctl start'
  alias stop='sudo systemctl stop'
  alias restart='sudo systemctl restart'
fi

alias sss='screen -R'

alias ppp='echo -n `pwd` | pbcopy'

alias z-reload='. ~/.zshrc && . ~/.zshrc.local'
alias .env='set -a; source .env; set +a;'
