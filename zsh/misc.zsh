setopt auto_cd

#WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
WORDCHARS='*'
#------------------------------------------------
#| wordとみなす文字を羅列。
#| C-wタイプすると、このword単位で削れる。
#| $ vi /etc/conf.d/keymaps[C-w]
#| $ vi /etc/conf.d/
#| ・・・みたいな
#------------------------------------------------

setopt  auto_pushd
setopt  pushd_ignore_dups    # スタックから重複排除

setopt  correct

# {0-9a-z} -> 0 1 .. 8 9 a b .. y z
setopt braceccl

HISTFILE=$HOME/.zsh-history             # 履歴をファイルに保存する
HISTSIZE=100000                         # メモリ内の履歴の数
SAVEHIST=100000                         # 保存される履歴の数
# setopt share_history                    # 複数のセッションで履歴を共有
setopt hist_ignore_all_dups             # 履歴から重複排除
setopt extended_history                 # 履歴ファイルに時刻を記録
setopt transient_rprompt                # 最新行以外の右プロンプトを消してくれるらしい
setopt extended_glob                    # ^と~使ってファイルを除外
