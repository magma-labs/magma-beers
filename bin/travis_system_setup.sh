#!/bin/bash
wget "http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip
rm chromedriver_linux64.zip
mkdir /home/travis/bin
mv chromedriver /home/travis/bin
gem update --system
bin/rails db:migrate
