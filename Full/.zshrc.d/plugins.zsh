#####
##  zshに読み込ませるモジュールやプラグインをautoloadで読み込ませる。
#####



	###  自作関数系  ###
	# OS ex2.5 課題  「for と ** を組み合わせた機能の実装」
	# 「カレントディレクトリ内かそれ以下の階層で、
	# 検索文字列をファイル名に含むファイルを、一括でrenameするコマンド」
# 	function renames() {
# 	    for f (**/*) 
# 	      if echo $f:t | grep $1 >/dev/null; then
# 	    	nf=`echo $f:t | sed -e s/$1/$2/`
# 	    	mv $f:h/$f:t $f:h/$nf
# 	      fi
# 	}
# 	
# 	# 「（$1）(検索) 文字列」を、「（$4）ディレクトリ(パス)」以下の
# 	# 「（$3）ある拡張子」を持つ全てのファイル から全文検索し、
# 	# 全てのファイル内の$1を「（$2）(置換) 文字列」に書き換えるコマンド。
# 	function grp_sed() {
# 		grep -rl $1 --include='*.'$4 $3 | xargs perl -i -pe "s/$1/$2/g"
# 	}
	
# 	# オリジナルアプリ memo
# 	MEMODIR=~/jjjmade/command_MEMOs/
# 	function memo() {
# 		local -A opthash
# 		zparseopts -D -A opthash -- -help -version l r w
# 		local isSHOW=0
# 		# エディターを変えたい場合は、ここを指定する。
# 		local editor=emacs
# 		# オプションでない引数が$@に残る
# 		# echo "normal arguments : $@"
# 		local p=$MEMODIR$@[1]
# 
# 		if [[ -n "${opthash[(i)-l]}" ]]; then
# 		  # -lが指定された場合
# 		  ls $MEMODIR
# 		fi
# 				
# 		if [[ -n "${opthash[(i)--help]}" ]]; then
# 		  # --helpが指定された場合
# 		  echo "--help option"
# 		fi
# 		
# 		if [[ -n "${opthash[(i)--version]}" ]]; then
# 		  # --versionが指定された場合
# 		  echo "version : 0.50"
# 		fi
# 		
# 		if [[ -n "${opthash[(i)-w]}" ]]; then
# 		  # -w : 通常の表示モード。エイリアスで省略可にしてある。
# 		  isSHOW=1  # w の時は、cat しない。
# 		  touch $p
# 		  $editor $p 
# 		fi
# 		
# 		if [[ -n "${opthash[(i)-r]}" ]]; then
# 		  # -r : 通常の表示モード。エイリアスで省略可にしてある。
# 		  touch $p
# 		  if [ $isSHOW -eq 0 ]; then
# 		  	less $p
# 		  fi
# 		fi
# 		
# 	}
# 	alias memo='memo -r'
	
	
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


	###  peco  ###
	##  ^R : コマンド履歴検索
	function peco-history-selection() {
	    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
	    CURSOR=$#BUFFER
	    zle reset-prompt
	}
	zle -N peco-history-selection
	bindkey '^R' peco-history-selection

	##  ^E : cdr (フォルダ履歴検索)
	if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
	    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
	    add-zsh-hook chpwd chpwd_recent_dirs
	    zstyle ':completion:*' recent-dirs-insert both
	    zstyle ':chpwd:*' recent-dirs-default true
	    zstyle ':chpwd:*' recent-dirs-max 1000
		# 存在しない場合
		mkdir -p "$HOME/.zshrc.d/.cache/" 2>/dev/null
	    zstyle ':chpwd:*' recent-dirs-file "$HOME/.zshrc.d/.cache/chpwd-recent-dirs"
	fi
	
	function peco-cdr () {
	    local selected_dir="$(cdr -l | sed 's/^[[:digit:]]*[[:blank:]]*//' | peco --prompt="cdr >" --query "$LBUFFER")"
	    if [ -n "$selected_dir" ]; then
	        BUFFER="cd ${selected_dir}"
	        zle accept-line
	    fi
	}
	zle -N peco-cdr
	bindkey '^E' peco-cdr
	
	
	
	