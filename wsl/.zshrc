export WINDOWS_USER="$(/mnt/c/Windows/System32/cmd.exe /c echo %USERNAME%)"

cd "$HOME"
umask 002

export PATH="/mnt/c/Windows:$PATH"
export PATH="/mnt/c/Windows/System32:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/mnt/c/Users/$WINDOWS_USER/AppData/Local/Programs/Microsoft VS Code/bin:$PATH"
export PATH="/mnt/c/ProgramData/chocolatey/bin:$PATH"
export PATH="/mnt/c/Program Files/Docker/Docker/Resources/bin:$PATH"

alias cmd="cmd.exe"
alias docker="docker.exe"
alias docker-compose="docker-compose.exe"

eval "$(ssh-agent -s) ssh-add" > /dev/null 2>&1

export DISPLAY="127.0.0.1:0.0"

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
