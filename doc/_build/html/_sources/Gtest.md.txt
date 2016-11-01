Gtest
========
**1. Descargar el repositorio**
git clone https://github.com/google/googletest.git

**2. Compilar la libreria** 

cd googletest <br>

cmake -DBUILD_SHARED_LIBS=ON . <br>
make <br>
cd googletest <br>

sudo cp -a include/gtest /usr/include <br>

cmake -DBUILD_SHARED_LIBS=ON . <br>
make <br>
sudo cp -a libgtest_main.so libgtest.so /usr/lib/ <br>

**3. Updatear la cache del linker** <br>
$ sudo ldconfig -v | grep gtest <br>

Deberiamos ver esto <br>
libgtest.so.0 -> libgtest.so.0.0.0 <br>
libgtest_main.so.0 -> libgtest_main.so.0.0.0 <br>
