#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

export PATH=/usr/local/bin:/opt/homebrew/bin:/sbin:/bin:/usr/bin:/usr/texbin:$PATH

# 文字コードの設定
export LANG=ja_JP.UTF-8
# 補完機能
autoload -U compinit
compinit
# 大文字小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100
setopt hist_ignore_dups


### originals ###
# 履歴上一つ前のディレクトリに移動する
DIRSTACKSIZE=10
setopt AUTO_PUSHD
alias bd=popd





###  zsh (zplug) で fish  ###
# zplugがなければzplugをインストール後zshを再起動
export ZPLUG_HOME=${HOME}/.zshrc.d/.zplug
mkdir -p $ZPLUG_HOME/ 2>/dev/null
if [ ! -e "${ZPLUG_HOME}/init.zsh" ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ${ZPLUG_HOME}/init.zsh

# ここに入れたいプラグインを書いていく(gitのパスで)
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-autosuggestions'
# なぜか原因不明のエラーでインストールできない...。
#zplug "peco/peco", as:command, from:gh-r
zplug "mollifier/anyframe"

# プラグインがまだインストールされてないならインストールするか聞く
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# .zplug以下にパスを通す。プラグイン読み込み
zplug load # --verbose  ### Display the version of zplug




## zshのプロンプト書式設定
autoload -U colors
colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
# ユーザ名@ホスト名
PS1="%{$fg[yellow]%}[${USER}@${HOST%%.*}]%{${reset_color}%} %1~%(!.#.$) > "
# 現在時刻
RPROMPT=$'[ %{\e[38;5;251m%}%D{%b%d}, %T%{\e[m%} ]'
TMOUT=10
TRAPALRM() {
      zle reset-prompt
}
