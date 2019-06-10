	###  zshのプロンプト書式設定  ###
	autoload -Uz colors
	colors
	
	autoload -Uz vcs_info
	zstyle ':vcs_info:*' formats '[%b]'
	zstyle ':vcs_info:*' actionformats '[%b|%a]'
	precmd () {
	  # 1行あける
	  print
	  # カレントディレクトリ
	  local left="%{$fg[cyan]%}[${USER}@${HOST%%.*}] %{\e[38;5;2m%}(%~)%{\e[m%}"
	  # バージョン管理されてた場合、ブランチ名
	  vcs_info
	  local right="%{\e[38;5;32m%}${vcs_info_msg_0_}%{\e[m%}"
	  # スペースの長さを計算
	  # テキストを装飾する場合、エスケープシーケンスをカウントしないようにします
	  local invisible='%([BSUbfksu]|([FK]|){*})'
	  local leftwidth=${#${(S%%)left//$~invisible/}}
	  local rightwidth=${#${(S%%)right//$~invisible/}}
	  local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth) % $COLUMNS))
	
	  print -P $left${(r:$padwidth:: :)}$right
	}
	### zshのRPROMPTがずれるのを直す：https://qiita.com/gorohash/items/e622459b330cbaef5fe5
	### 色指定の部分を bash の場合は \[ \] で囲む。zsh の場合は %{ %} で囲む
	# ユーザ名@ホスト名
	PS1="%{$fg[yellow]%}%1~/ %(!.#.$)>  %{${reset_color}%}"
	# 現在時刻
	RPROMPT=$'[%{\e[38;5;251m%}%D{%b/%d}, %T%{\e[m%} ]'
	TMOUT=15
	TRAPALRM() {
	  zle reset-prompt
	}

	
	###  その他、色を付ける設定  ###
	## ls
	# BSD系 (Mac)
	export LSCOLORS=gxxhghfhxxegedabaggbGb
	alias ls='ls -G'
	## GNU系 (Linux)
	#export LS_COLORS=gxxhghfhxxegedabaggbGb
	#alias ls='ls --color'
	
	
	## zsh 補完
	# http://neko-mac.blogspot.com/2015/03/mac_18.html
	# 色の値が少しズレているので注意。
	zstyle ':completion:*' list-colors di=36 ln=35 ex=31
	zstyle ':completion:*:kill:*' list-colors \
	   		'=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
	
	# 一覧表示の形式設定
	zstyle ':completion:*' group-name ''
	zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'


