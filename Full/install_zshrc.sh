# .zshrc を ホームにコピーする。
cp  alias/.zshrc  ~/

# 編集用のシンボリックリンクを作る。
ln -s  ~/.zshrc.d/.git_repository/Full/.zshenv  ~/.zshrc.d/
ln -s  ~/.zshrc.d/.git_repository/Full/.zshrc  ~/.zshrc.d/
ln -s  ~/.zshrc.d/.git_repository/Full/.zshrc.d  ~/.zshrc.d/

# ターミナルのデザインファイルを読み込み
open Pro-Custom.terminal

