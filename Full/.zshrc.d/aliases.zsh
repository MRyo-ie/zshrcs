#####
##  zshで使用するエイリアスを書く
#####

	# システム系
	alias bd=popd
	alias rezsh='exec zsh -l'
	
	# ファイル名を一括変更
	autoload -Uz zmv
#	alias zmv='noglob zmv -W'
	alias zmvw='noglob zmv -W'

	alias grep='grep --color=always'
	alias rsync='rsync -auvz --progress --exclude ".DS_Store" '
	
	#alias mamp_mysql='/Applications/MAMP/Library/bin/mysql --auto-rehash -u root -ps9_04'

	alias rsyncDEL='rsync -auvz --progress --exclude ".DS_Store" --delete'
	
	# ls を使いやすく
	alias ls='ls -F'
	alias lsa='ls -FA'
	alias l='ls -lFA'

	# brew doctor で、pyenv関係の warningを消す。
	alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"
	
	# git を早く打つ
	alias g='git'
	alias g_aliases='git config --global --list | grep ^alias\.'
	
	# source ~/.zshrc とか、いちいち打つの面倒なので...
	alias source_zrc='source ~/.zshrc'
	alias source_zenv='source ~/.zshenv'

