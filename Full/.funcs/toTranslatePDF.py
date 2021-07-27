# install
#   https://pypi.org/project/Translation-Gummy/
# 解説記事
#   https://qiita.com/cabernet_rock/items/1f9bff5e0b9363da312d

import shutil
import sys
import os
from gummy import TranslationGummy


tmpl_dir = '/Volumes/GoogleDrive/マイドライブ/研究/【survey】/[Rank```S]/【テンプレ】'
tmpl_files = ['論文分解v2.0.md', 'モデル図.drawio']

if __name__ == "__main__":
    print(sys.argv[1:])
    for sc_file in sys.argv[1:]:
        print(f'\n[Info] {sc_file} の翻訳を開始します！')

        sc_file_name = os.path.basename(sc_file).split('.')[0]
        os.makedirs(sc_file_name, exist_ok=True)

        model = TranslationGummy(gateway="utokyo", translator="deepl")
        pdfpath = model.toPDF(sc_file, path=f'./{sc_file_name}/translated')

        shutil.move(f'{sc_file}', f'./{sc_file_name}/')
        # 論文分解テンプレファイルをコピー
        for tmpl_f in tmpl_files:
            shutil.copy(os.path.join(tmpl_dir, tmpl_f), f'./{sc_file_name}/')

        print(f'\n[Info] {sc_file} の翻訳完了！')


