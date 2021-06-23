

if [ $# = 0 ]; then
    python3  ~/.zshrc.d/.git_repository/Full/.funcs/toTrans_update_Selenium/check_driver.py
    echo "\nダウンロード ↓\n    http://chromedriver.chromium.org/downloads"
    exit 1
else
    # https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_mac64.zip
    wget "https://chromedriver.storage.googleapis.com/$1/chromedriver_mac64.zip"
    unzip chromedriver_mac64.zip
    mv chromedriver /usr/local/bin/chromedriver
    chmod +x /usr/local/bin/chromedriver
fi
