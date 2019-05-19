## 各種設定ファイルを読み込み
for rcfile in $HOME/.zshrc.d/.backup.git/Full/.zshrc.d/*; do [ -r $rcfile ] && source $rcfile; done

# 補完機能を有効にする
# 最後に書くと、少しだけ速くなるっぽい？
autoload -Uz compinit; compinit


# rbenv の優先度を上げる。
## rbenv (ruby) 
export PATH=$HOME/.rbenv/shims/ruby:$PATH
#eval "$(rbenv init -)"


## 起動が遅い時に、起動時間を分析（プロファイル）するやつ。（zprof）
#if (which zprof > /dev/null) ;then zprof | less ; fi

