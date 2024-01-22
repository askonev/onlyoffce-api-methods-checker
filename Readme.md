# Ruby selenium



How to install a chrome driver in Linux

For doing so, you need a headless browser.

1) You need to install Chrome Binary

    # Install Chrome.
    sudo curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
    sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
    # Update our system
    sudo apt-get -y update
    # Install Chrome
    sudo apt-get -y install google-chrome-stable

2) Afterwards, you need to install Chrome Driver.

    # Install Chromedriver
    wget -N https://chromedriver.storage.googleapis.com/95.0.4638.54/chromedriver_linux64.zip -P ~/
    unzip ~/chromedriver_linux64.zip -d ~/
    # Remove zip file
    rm ~/chromedriver_linux64.zip
    # Move driver to bin location
    sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
    # Give it rights
    sudo chown root:root /usr/local/bin/chromedriver
    sudo chmod 0755 /usr/local/bin/chromedriver
