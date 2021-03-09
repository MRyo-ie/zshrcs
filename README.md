# 使い方
## init
1. `~/.zshrc.d/` ディレクトリを作る。
2. `~/.zshrc.d/` 下に入って、このリポジトリを clone する。
3. 2. のディレクトリ名を `.git_repository/` に変更する。
  （`~/.zshrc.d/.git_repository/~` になればOK）
  
## Full ver の場合
### 基本設定
1. `Full/alias/.zshrc` を、`~/` にコピーする。

### オススメ機能
- オリジナルコマンド（`Full/.zshrc.d/aliases.zsh`）
  - `$ edit_zsh`
    - VS Code が入っていれば、このリポジトリを、VS Code で直接開けます。
  - python お役立ちスクリプト系
    - `.funcs/` にいろいろ入ってます。
    - `$ mkdirs_list`
      - ディレクトリ一括作成。
      - 引数
        - 作成したいディレクトリの一覧が書かれた txtファイルのファイル名。
    - `$ org_trans_enpdf`
      - TranslationGummy を使って、英語論文PDF を日本語に翻訳する。
      - 引数
        - 翻訳したい PDF ファイルのパス
      - 出力： `translated/` 以下に、翻訳済み PDF ができます。
    - `$ edit_zsh`
      - VS Code で、このリポジトリが開きます。
      - 意外と便利（笑）

