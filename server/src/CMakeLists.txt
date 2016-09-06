cmake_minimum_required(VERSION 2.6)

project(server)

set(SOURCES
		ApiJsonController.h
		ApiJsonController.cpp
		DBHandler.h
		DBHandler.cpp
		LinkedinWebController.h
		LinkedinWebController.cpp
		base64.h
		base64.cpp
        main.cpp
)

set(CMAKE_CXX_FLAGS "-std=c++11")
#set(CMAKE_CXX_FLAGS "-Wall -Werror -Wextra -Wconversion -Wtype-limits -pedantic -pedantic-errors")

# Generar el ejecutable
add_executable (${PROJECT_NAME} ${SOURCES})

# Aniadir dependencias a otras acciones
add_dependencies (${PROJECT_NAME} mongoose)

# Includes a realizar para el proyecto (-I/home/pepe/etc/)
include_directories ("${PROJECT_SOURCE_DIR}/../mongoose-cpp")

# Linkear contra bibliotecas
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries (${PROJECT_NAME} mongoose)
target_link_libraries (${PROJECT_NAME} leveldb)
