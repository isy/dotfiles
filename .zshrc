# 環境変数
export LANG=ja_JP.UTF-8
 
# 補完機能有効化
autoload -Uz compinit
compinit
 
# 色使用有効化
autoload -Uz colors
colors
 
# cd後、自動的にpushdする
setopt auto_pushd
 
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
 
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
 
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beepを無効
setopt no_beep
 
# Ctrl+Dでzshを終了しない
setopt ignore_eof
 
# '#'以降をコメントとして扱う
setopt interactive_comments
 
# プロンプト
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "
 
# エイリアス
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
 
alias grep='grep --color=auto'
 
#同時に起動したzshの間でヒストリを共有する
setopt share_history
 
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
   
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs
# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types
# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu
# カッコの対応などを自動的に補完
setopt auto_param_keys
# 語の途中でもカーソル位置で補完
setopt complete_in_word
 
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
# 構文のハイライト(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting"
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
# Then, source plugins and add commands to $PATH
zplug load
