Jsoncpp-Mongoose-LevelDB
========================

## **1- Guia de instalacion leveldb**

Instalar git-core and libsnappy-dev <br>

      sudo apt-get install git-core libsnappy-dev

Clonar leveldb del repositorio de git <br>

      git clone  https://github.com/google/leveldb.git 

Compilación <br>

      cd leveldb 
      make

Instalación <br>

      cd out-shared
      sudo cp --preserve=links libleveldb.* /usr/local/lib 
      cd ../include 
      sudo cp -R leveldb /usr/local/include/ 
      sudo ldconfig 

## **2- Instalacion mongoose-cpp y jsoncpp**

Para instalar mongoose-cpp y jsoncpp y poder compilar el server, se deben seguir estos pasos

1. Hacer un checkout del proyecto [jsoncpp](https://github.com/open-source-parsers/jsoncpp) <br>

        git clone https://github.com/open-source-parsers/jsoncpp.git

2. dentro de jsoncpp ejecutar comandos:
        mkdir build
        cd build
        cmake ..
        sudo make install

Con esto logramos instalar jsoncpp en linux, creo que lo que hace es copiar todo el codigo a /usr/local/include y cuando compilas, se buscan todos los includes en $PATH que contiene a /usr/local/include.
Y listo! Porque la carpeta de mongoose-cpp la tenemos dentro de nuestro proyecto, asi que los pasos son:

        cd server
        mkdir build && cd build
        cmake ..
        make
        ./src/server

Y ya está el server andando escuchando en localhost, puerto 8080. Abrir en el navegador:
        
        localhost:8080/

