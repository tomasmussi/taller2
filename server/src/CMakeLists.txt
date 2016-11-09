cmake_minimum_required(VERSION 2.6)

FILE(GLOB SOURCES ./*.cpp)
	
set(CMAKE_CXX_FLAGS "-std=c++11 -fprofile-arcs -ftest-coverage -Wall")
set( CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -lgcov" )

#set(CMAKE_CXX_FLAGS "-std=c++11 -Wall")
#set(CMAKE_CXX_FLAGS "-Wall -Werror -Wextra -Wconversion -Wtype-limits -pedantic -pedantic-errors")

# Generar el ejecutable
add_executable (${PROJECT_NAME} ${SOURCES})

# Aniadir dependencias a otras acciones
add_dependencies (${PROJECT_NAME} mongoose)

# Includes a realizar para el proyecto (-I/home/pepe/etc/)
include_directories ("${PROJECT_SOURCE_DIR}/mongoose-cpp")
#include_directories ("${PROJECT_SOURCE_DIR}/curlpp/include")

add_library (server_sources ${SOURCES})

# Linkear contra bibliotecas
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries (${PROJECT_NAME} mongoose)
target_link_libraries (${PROJECT_NAME} leveldb)
target_link_libraries (${PROJECT_NAME} curlpp)
target_link_libraries (${PROJECT_NAME} curl)
target_link_libraries (${PROJECT_NAME} log4cpp)
