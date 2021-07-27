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
	alias rsyncDEL='rsync -auvz --progress --delete'
	alias rsyncEX_mac_py='rsync  -auvz --progress --exclude-from=$HOME/.zshrc.d/.git_repository/Full/.rsync/.ex_mac_py'
	alias rsyncEX_gitignore='rsync  -auvz --progress --exclude-from=.gitignore   --exclude .git'
	
	#alias mamp_mysql='/Applications/MAMP/Library/bin/mysql --auto-rehash -u root -ps9_04'

	
	# ls を使いやすく
	alias ls='ls -F'
	alias lsa='ls -FA'
	alias l='ls -lFA'

	# brew doctor で、pyenv関係の warningを消す。
	# alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"
	
	# git を早く打つ
	alias g='git'
	alias g_aliases='git config --global --list | grep ^alias\.'

    # docker を早く打つ
    alias d='sudo docker'
    alias dc='sudo docker-compose'
    alias dc_exec-tf1='dc_cd ml_all-tf1; dc exec ml_all-tf1  zsh'

	# source ~/.zshrc とか、いちいち打つの面倒なので...
	alias source_zsh='source ~/.zshrc'

	##  自作関数  ##
	alias mkdirs_list='python3  ~/.zshrc.d/.git_repository/Full/.funcs/mkdirs_txt_list.py'
    # # org_ 系
	# alias org_trans_enpdf='python3  ~/.zshrc.d/.git_repository/Full/.funcs/toTranslatePDF.py'
    # edit_ 系
	alias edit_zsh='code /Users/m_ryo/.zshrc.d/.git_repository'
