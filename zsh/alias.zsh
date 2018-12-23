alias -g G='| grep '
alias -g M='| more '
alias tmux='tmux -u'

if [ 'Darwin' = $(uname -s) ]; then
  alias ls='ls -FG'   # Mac
else
  alias ls='ls -Fv --color'  # Linux
fi
alias ll='ls -lh'
alias la='ls -lah'
alias lR='ls -lahR'

alias a=atom
alias b=brew
alias c=pbcopy
alias d=docker
# alias e=
alias f='git fetch'
alias g=git
alias h='history -E 1 | less +G'
# alias i=
# alias j=
alias k=kubectl
alias l=less
# alias m=
# alias n=n
alias o=open
alias p=pbpaste
# alias q=q
alias r='bundle exec spring rails' # r is a shell builtin
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
alias dff='git diff'
alias dfff='git difftool'
alias dffff='git difftool origin/$(git rev-parse --abbrev-ref HEAD) HEAD'
alias fetch='git fetch'
alias push='git push'
alias pull='git pull'
alias wip='git add . && git commit -a -m "[ci skip] WIP WIP WIP WIP WIP"'
alias branch-clean='git branch --merged origin/master | grep -v master | xargs -n1 git branch -D'
alias stash='git stash -u'
alias pop='git stash pop'
alias stage='git push -f origin HEAD:staging'

alias gh='github'

alias dx='docker run -it --rm'
alias rx='rbenv exec'
alias bx='bundle exec'
alias nx='npx nodemon -x'

alias sl='brew services list'
alias run='brew services run'
alias start='brew services start'
alias stop='brew services stop'
alias restart='brew services restart'
alias upgrade='brew update && brew upgrade && brew cleanup && brew leaves'
alias cask='brew cask'

alias e2e='yarn test:e2e'

alias sss='screen -R'

alias ppp='echo -n `pwd` | pbcopy'
alias j2y='json2yaml'
alias y2j='yaml2json'

alias z-reload='. ~/.zshrc && . ~/.zshrc.local'
