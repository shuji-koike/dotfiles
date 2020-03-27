# setopt prompt_subst

case $UID in
  0) UID_COLOR=${fg[red]} ;;
  *) UID_COLOR=${fg[green]} ;;
esac

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}'
zstyle ':vcs_info:git:*' formats       '[%r%F{yellow}@%f%F{green}%u%c%b%f]' '%S'
zstyle ':vcs_info:git:*' actionformats '[%r%F{yellow}@%f%F{green}%u%c%b%f%F{red}|%a%f]' '%S'

add-zsh-hook precmd _update_rprompt
function _update_rprompt() {
  LANG=en_US.UTF-8 vcs_info
  PROMPT="[%{$UID_COLOR%}%n%F{yellow}@%f${HOST_COLOR}%m%f]"
  RPROMPT="%F{blue}(%~)%f"
  if [[ -n "$vcs_info_msg_0_" ]]; then
    PROMPT="${vcs_info_msg_0_/(remotes|heads)\/}"
    if [[ "$vcs_info_msg_1_" = "." ]]; then
      RPROMPT=""
    else
      RPROMPT="%F{blue}($vcs_info_msg_1_)%f"
    fi
  fi
  PROMPT="$PROMPT %(!.#.$)%f "
}

PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
