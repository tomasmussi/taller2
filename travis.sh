#!/bin/bash

# Instalacion biblioteca jsoncpp
git clone https://github.com/open-source-parsers/jsoncpp.git
cd jsoncpp && mkdir build && cd build
cmake ..
sudo make install

cd ../..

# Instalacion biblioteca leveldb
git clone https://github.com/google/leveldb.git
cd leveldb
make
cd out-shared
sudo cp --preserve=links libleveldb.* /usr/local/lib
cd ../include
sudo cp -R leveldb /usr/local/include/
sudo ldconfig

cd ../..

#Instalacion de google test
git clone https://github.com/google/googletest.git
cd googletest
mkdir build && cd build
cmake -DBUILD_SHARED_LIBS=ON ..
make
cd ../googletest

sudo cp -a include/gtest /usr/include
cmake -DBUILD_SHARED_LIBS=ON .
make
sudo cp -a libgtest_main.so libgtest.so /usr/lib/
sudo ldconfig
cd ../..

