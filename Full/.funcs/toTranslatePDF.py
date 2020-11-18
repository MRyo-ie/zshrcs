# install
#  https://pypi.org/project/Translation-Gummy/

import sys
from gummy import TranslationGummy

if __name__ == "__main__":
    sc_file = sys.argv[1]

    model = TranslationGummy(gateway="utokyo", translator="deepl")
    pdfpath = model.toPDF(sc_file, path="translated.pdf")



