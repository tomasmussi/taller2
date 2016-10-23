cmake_minimum_required(VERSION 2.6)
PROJECT(testing)
# We need thread support
find_package(Threads REQUIRED)

INCLUDE_DIRECTORIES(${server_SOURCE_DIR}/src)
set(SOURCES
    test.cpp
)

#EZE: agregue este comando que ingresa en la variable SOURCES_PROGRAM un listado 
#de todos los archivos que contiene la capeta especificada
FILE(GLOB SOURCES_PROGRAM ../src/*.cpp)

set(PRUEBA ${CMAKE_CURRENT_SOURCE_DIR}/..src//main.cpp)

#Elimino el main del app_server ya que sino no me deja compilar
#ya que voy a tener dos main el de los test y el del server
list(REMOVE_ITEM SOURCES_PROGRAM ${CMAKE_CURRENT_SOURCE_DIR}/../src/main.cpp)

include_directories ("../mongoose-cpp")

SET(CMAKE_CXX_FLAGS "-g -std=c++11 -O0 -Wall -fprofile-arcs -ftest-coverage --coverage")
SET(CMAKE_C_FLAGS "-g -O0 -Wall -W -fprofile-arcs -ftest-coverage --coverage")
SET(CMAKE_EXE_LINKER_FLAGS "-fprofile-arcs -ftest-coverage --coverage")

# Generar el ejecutable
add_executable (${PROJECT_NAME} ${SOURCES} ${SOURCES_PROGRAM})

# Aniadir dependencias a otras acciones

# Includes a realizar para el proyecto (-I/home/pepe/etc/)
add_dependencies (${PROJECT_NAME} mongoose)

# Linkear contra bibliotecas
target_link_libraries (${PROJECT_NAME} gtest_main)
target_link_libraries (${PROJECT_NAME} gtest)
target_link_libraries (${PROJECT_NAME} pthread)
target_link_libraries (${PROJECT_NAME} mongoose)
target_link_libraries (${PROJECT_NAME} leveldb)
target_link_libraries (${PROJECT_NAME} jsoncpp)
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries (${PROJECT_NAME} mongoose)
target_link_libraries (${PROJECT_NAME} curlpp)
target_link_libraries (${PROJECT_NAME} curl)
target_link_libraries (${PROJECT_NAME} log4cpp)
