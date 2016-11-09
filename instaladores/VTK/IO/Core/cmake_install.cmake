# Install script for directory: /home/ezequiel/VTK/IO/Core

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "RuntimeLibraries")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkIOCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkIOCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOCore-7.1.so"
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/IO/Core/CMakeFiles/vtkIOCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/IO/Core/vtkAbstractParticleWriter.h"
    "/home/ezequiel/VTK/IO/Core/vtkArrayReader.h"
    "/home/ezequiel/VTK/IO/Core/vtkArrayWriter.h"
    "/home/ezequiel/VTK/IO/Core/vtkASCIITextCodec.h"
    "/home/ezequiel/VTK/IO/Core/vtkBase64InputStream.h"
    "/home/ezequiel/VTK/IO/Core/vtkBase64OutputStream.h"
    "/home/ezequiel/VTK/IO/Core/vtkBase64Utilities.h"
    "/home/ezequiel/VTK/IO/Core/vtkDataCompressor.h"
    "/home/ezequiel/VTK/IO/Core/vtkDelimitedTextWriter.h"
    "/home/ezequiel/VTK/IO/Core/vtkGlobFileNames.h"
    "/home/ezequiel/VTK/IO/Core/vtkInputStream.h"
    "/home/ezequiel/VTK/IO/Core/vtkJavaScriptDataWriter.h"
    "/home/ezequiel/VTK/IO/Core/vtkOutputStream.h"
    "/home/ezequiel/VTK/IO/Core/vtkSortFileNames.h"
    "/home/ezequiel/VTK/IO/Core/vtkTextCodec.h"
    "/home/ezequiel/VTK/IO/Core/vtkTextCodecFactory.h"
    "/home/ezequiel/VTK/IO/Core/vtkUTF16TextCodec.h"
    "/home/ezequiel/VTK/IO/Core/vtkUTF8TextCodec.h"
    "/home/ezequiel/VTK/IO/Core/vtkAbstractPolyDataReader.h"
    "/home/ezequiel/VTK/IO/Core/vtkWriter.h"
    "/home/ezequiel/VTK/IO/Core/vtkZLibDataCompressor.h"
    "/home/ezequiel/VTK/IO/Core/vtkArrayDataReader.h"
    "/home/ezequiel/VTK/IO/Core/vtkArrayDataWriter.h"
    "/home/ezequiel/VTK/build/IO/Core/vtkIOCoreModule.h"
    )
endif()

