#!/bin/bash
# -*- ENCODING: UTF-8 -*-
if [ -d ./build/test ] 
then
./build/test/testing 1
lcov --capture --directory ./build/test/CMakeFiles/testing.dir/__/src/ --output-file ./build/test/CMakeFiles/testing.dir/__/src/coverage.info
genhtml ./build/test/CMakeFiles/testing.dir/__/src/coverage.info --output-directory ./coverage
firefox ./coverage/src/index.html;
else
echo "Los test no está compilados"
fi
exit
