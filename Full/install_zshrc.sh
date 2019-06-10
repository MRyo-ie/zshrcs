# .zshrc を ホームにコピーする。
cp  alias/.zshrc  ~/

# 編集用のシンボリックリンクを作る。
ln -s  ~/.zshrc.d/.git_repo/Full/.zshenv  ~/.zshrc.d/
ln -s  ~/.zshrc.d/.git_repo/Full/.zshrc  ~/.zshrc.d/
ln -s  ~/.zshrc.d/.git_repo/Full/.zshrc.d  ~/.zshrc.d/
