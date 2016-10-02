cmake_minimum_required(VERSION 2.6)
PROJECT(testing)
# We need thread support
find_package(Threads REQUIRED)

INCLUDE_DIRECTORIES(${server_SOURCE_DIR}/src)
set(SOURCES
        test.cpp
				../src/DBHandler.h
				../src/DBHandler.cpp
)

set(CMAKE_CXX_FLAGS "-std=c++11")
#set(CMAKE_CXX_FLAGS "-Wall -Werror -Wextra -Wconversion -Wtype-limits -pedantic -pedantic-errors")

# Generar el ejecutable
add_executable (${PROJECT_NAME} ${SOURCES})

# Aniadir dependencias a otras acciones

# Includes a realizar para el proyecto (-I/home/pepe/etc/)

# Linkear contra bibliotecas
target_link_libraries (${PROJECT_NAME} gtest_main)
target_link_libraries (${PROJECT_NAME} gtest)
target_link_libraries (${PROJECT_NAME} pthread)
target_link_libraries (${PROJECT_NAME} leveldb)
target_link_libraries (${PROJECT_NAME} jsoncpp)
#target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
#target_link_libraries (${PROJECT_NAME} mongoose)
#target_link_libraries (${PROJECT_NAME} leveldb)
