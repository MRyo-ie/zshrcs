# install
#  https://pypi.org/project/Translation-Gummy/

import sys
import os
from gummy import TranslationGummy


if __name__ == "__main__":
    print(sys.argv[1:])
    for sc_file in sys.argv[1:]:
        print(f'\n[Info] {sc_file} の翻訳を開始します！')

        os.makedirs('translated', exist_ok=True)

        model = TranslationGummy(gateway="utokyo", translator="deepl")
        pdfpath = model.toPDF(sc_file, out_dir="./translated/")

        print(f'\n[Info] {sc_file} の翻訳完了！')


