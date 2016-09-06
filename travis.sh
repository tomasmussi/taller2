#!/bin/bash

# Instalacion biblioteca jsoncpp
git clone https://github.com/open-source-parsers/jsoncpp.git
cd jsoncpp
mkdir build
cd build
cmake ..
sudo make install

# Instalacion biblioteca leveldb
cd ../..
git clone https://github.com/google/leveldb.git
cd leveldb
make

echo "ECHOOOOOOOOOOOOOOOOOO!"
echo $?
cd out-shared sudo cp --preserve=links libleveldb.* /usr/local/lib
echo $?
cd ../include
echo $?
sudo cp -R leveldb /usr/local/include/
echo $?
sudo ldconfig
echo $?
echo "SEGUNDO SEGUNDO SEGUNDO"
echo $?
