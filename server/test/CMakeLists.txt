cmake_minimum_required(VERSION 2.6)
PROJECT(testing)
# We need thread support
find_package(Threads REQUIRED)

INCLUDE_DIRECTORIES(${server_SOURCE_DIR}/src)
set(SOURCES
    test.cpp
)

FILE(GLOB SOURCES_PROGRAM ../src/*.cpp)

set(PRUEBA ${CMAKE_CURRENT_SOURCE_DIR}/..src//main.cpp)
message("${PRUEBA}")
#Elimino el main del app_server ya que sino no me deja compilar
list(REMOVE_ITEM SOURCES_PROGRAM ${CMAKE_CURRENT_SOURCE_DIR}/../src/main.cpp)

message("${SOURCES_PROGRAM}")
#set(CMAKE_CXX_FLAGS "-std=c++11")
include_directories ("../mongoose-cpp")

SET(CMAKE_CXX_FLAGS "-g -O0 -Wall -fprofile-arcs -ftest-coverage --coverage")
SET(CMAKE_C_FLAGS "-g -O0 -Wall -W -fprofile-arcs -ftest-coverage --coverage")
SET(CMAKE_EXE_LINKER_FLAGS "-fprofile-arcs -ftest-coverage --coverage")
#set(CMAKE_CXX_FLAGS "-Wall -Werror -Wextra -Wconversion -Wtype-limits -pedantic -pedantic-errors")

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
#target_link_libraries (${PROJECT_NAME} server_sources)
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries (${PROJECT_NAME} mongoose)
target_link_libraries (${PROJECT_NAME} curlpp)
target_link_libraries (${PROJECT_NAME} curl)
