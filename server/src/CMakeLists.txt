cmake_minimum_required(VERSION 2.6)

project(server)

set(SOURCES
        main.cpp
)
set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} -I/home/tomas/repos/taller2/server/mongoose-cpp/)

# Generar el ejecutable
add_executable (${PROJECT_NAME} ${SOURCES})

# Aniadir dependencias a otras acciones
add_dependencies (${PROJECT_NAME} mongoose)

# Includes a realizar para el proyecto (-I/home/pepe/etc/)
# TODO(tomas) VERIFICAR CUAL DE TODOS ESTOS REEMPLAZA AL -I DE ARRIBA QUE ES RE CABEZA
# include_directories ("${PROJECT_SOURCE_DIR}")
# include_directories ("${PROJECT_SOURCE_DIR}/mongoose-cpp")
# include_directories ("${PROJECT_SOURCE_DIR}/mongoose-cpp/mongoose")
# include_directories (mongoose)
# add_subdirectory("${PROJECT_SOURCE_DIR}/mongoose-cpp")

# Linkear contra bibliotecas
target_link_libraries (${PROJECT_NAME} ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries (${PROJECT_NAME} mongoose)
