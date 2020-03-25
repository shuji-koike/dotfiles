# setopt prompt_subst
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}'
zstyle ':vcs_info:git:*' formats '[%r%F{green}%u%c@%b%f]' '%S'
zstyle ':vcs_info:git:*' actionformats '[%r%F{green}%u%c@%b|%a%f]' '%S'
function _update_rprompt() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="%F{blue}(%~)%f"
  if [[ -n "$vcs_info_msg_0_" ]]; then
    RPROMPT="${vcs_info_msg_0_/(remotes|heads)\/}"
    [[ ! "$vcs_info_msg_1_" = "." ]] && RPROMPT="%F{blue}($vcs_info_msg_1_)%f $RPROMPT"
  fi
}
add-zsh-hook precmd _update_rprompt
