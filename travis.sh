#!/bin/bash          

sudo apt-get install https://github.com/open-source-parsers/jsoncpp.git
cd jsoncpp
mkdir build
cd build
cmake ..
sudo make install
