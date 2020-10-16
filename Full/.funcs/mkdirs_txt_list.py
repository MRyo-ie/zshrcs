import sys, os

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("[Error] 引数が不足しています")
        sys.exit(1)

    dirs_txt_path = sys.argv[1]
    dirs_list = []
    with open(dirs_txt_path, 'r') as f:
        d_list_str = f.read()
        for dname in d_list_str.split('\n'):
            if dname != '':
                print(dname)
                os.mkdir(dname)
    
