cmake_minimum_required(VERSION 2.6)

#Descomentar para generar el DEV
#FIND_PACKAGE(VTK REQUIRED)

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

#Descomentar para generar el deb 

#Se debe instalar antes el VTK
#sudo apt-get install freeglut3 freeglut3-dev
#sudo apt-get install binutils-gold
#instalar VTK
#git clone git://vtk.org/VTK.git
#mkdir VTK-build
#cd VTK-build
#cmake ..
# cmake -DVTK_DIR=/home/ezequiel/VTK/VTK-build .. ejecutar para compilar

#INSTALL(TARGETS ${PROJECT_NAME} DESTINATION appserver)
 
#SET(CPACK_PACKAGE_NAME "AppServer")
#SET(CPACK_GENERATOR "DEB")
#SET(CPACK_PACKAGE_VERSION_MAJOR "1")
#SET(CPACK_PACKAGE_VERSION_MINOR "0")
#SET(CPACK_PACKAGE_VERSION_PATCH "0")
#SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "DreamTeam") 
 
#INCLUDE(CPack)

#ejecutar cpack y luego dpkg -i paquete
#se instala en /usr/appserver


