# Install script for directory: /home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1/vtkhdf5" TYPE FILE FILES
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/H5DOpublic.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/H5DSpublic.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/H5IMpublic.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/H5LTparse.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/H5LTpublic.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/H5PTpublic.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/H5TBpublic.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/hdf5_hl.h"
    "/home/ezequiel/VTK/ThirdParty/hdf5/vtkhdf5/hl/src/vtk_libhdf5_hl_mangle.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "RuntimeLibraries")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkhdf5_hl-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkhdf5_hl-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkhdf5_hl-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/ezequiel/VTK/build/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

