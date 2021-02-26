#####
##  setoptもしくはsetコマンドで設定するzshのオプションを書く
#####

	# 補完で小文字でも大文字にマッチさせる
	zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
	# コマンドの履歴を保存するファイル
	HISTFILE=$HOME/.zshrc.d/.zsh_history
	HISTSIZE=1000
	SAVEHIST=1000
	setopt hist_ignore_dups
	
	# 履歴上一つ前のディレクトリに移動する
	# popd で呼び出し
	DIRSTACKSIZE=10
	setopt AUTO_PUSHD
	
    # zmv  zsh: no matches found: *_t.pdf
    setopt nonomatch


	### その他zshお役立ち
	bindkey '^J' self-insert
	
	# ssh config で設定したホスト名も Tab補間 できるようにする。
	function _ssh {
	  #compadd `fgrep 'Host ' ~/.ssh/config | awk '{print $2}' | sort`;
	  compadd `fgrep 'Host ' ~/.ssh/conf.d/*.config | awk '{print $2}' | sort`;
	   # 参考：https://suin.io/568
	}
	
