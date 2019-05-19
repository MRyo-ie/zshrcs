##############################################################
#   $ZDOTDIR/.zshenv は /etc/zshenv の適用範囲を縮小したもので、
#    自分のみが使用する。
#   このファイルでは環境変数を設定するべきである。
##############################################################


## 起動が遅い時に、起動時間を分析（プロファイル）するやつ。（zprof）
# zmodload zsh/zprof && zprof

 	###  PATHの設定  ###
	export PATH=/usr/local/bin:/sbin:/bin:/usr/bin:$PATH
	#/opt/homebrew/bin:
	# Prolog
	export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH
	# Python virtualenv
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
	#export VIRTUALENVWRAPPER_VIRTUALENV=/opt/homebrew/bin/virtualenv
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv.sh
	# Go
	export GOROOT=/usr/local/opt/go/libexec
	export GOPATH=$HOME/,p/pLanguages/Go
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
	# MAMP
#	export PATH=$PATH:/Applications/MAMP/Library/bin
	# MySQL@5.7
#	export PATH=/usr/local/opt/mysql@5.7/bin:$PATH
	# ET ロボコン
	export PATH=/usr/local/bin/gcc-arm-none-eabi-5_4-2016q2/bin:$PATH

	
	
	###  お役立ちコマンド設定  ###
	# 文字コードの設定
	export LANG=ja_JP.UTF-8

	###  env 系の設定  ###
	## direnv
	#export EDITOR=emacs
	#eval "$(direnv hook zsh)"
	
	
	##  jenv (java) 
	if which jenv > /dev/null; then eval "$(jenv init -)"; fi
	
	
	##  pyenv (python) の設定
	export PYENV_ROOT=${HOME}/.pyenv
	if [ -d "${PYENV_ROOT}" ]; then
		export PATH=${PYENV_ROOT}/bin:$PATH
		eval "$(pyenv init -)"
	fi
	##  pyenv-virtualenv
	if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
	
	## virtualenv
	export GNUTERM=aqua
	# 下記if文で指定した WORKON_HOME に仮想環境が構築される。
	# 必要になったら、コメントアウトを外す。
#	if [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ]; then
#	    export WORKON_HOME=$HOME/.virtualenvs
#	    source /usr/local/bin/virtualenvwrapper.sh
#	fi
	
	

	## nvm (Node.js) : Firebase
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
