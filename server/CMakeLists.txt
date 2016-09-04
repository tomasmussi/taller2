cmake_minimum_required(VERSION 2.8.4)
project(server)

if(CMAKE_COMPILER_IS_GNUCXX)
    # Errors and warnings.
    # set(CMAKE_CXX_FLAGS "-Wall -Werror -Wextra -Wconversion -Wtype-limits -pedantic -pedantic-errors")
    # Valgrind and debug
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_RELEASE} -ggdb -DDEBUG")
    # Optimizing
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -O3 -DNDEBUG")
endif(CMAKE_COMPILER_IS_GNUCXX)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules/")
#find_package(Cppunit REQUIRED)
#find_package(PkgConfig REQUIRED)
#find_package(Threads)
#include(CppLint)
#enable_testing()

include_directories(.)
add_subdirectory(src)
add_subdirectory(mongoose-cpp)
