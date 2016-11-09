# Install script for directory: /home/ezequiel/VTK/IO/Legacy

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOLegacy-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOLegacy-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkIOLegacy-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkIOLegacy-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOLegacy-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOLegacy-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/IO/Legacy/CMakeFiles/vtkIOLegacy.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/IO/Legacy/vtkCompositeDataReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkCompositeDataWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkDataObjectReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkDataObjectWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkDataReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkDataSetReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkDataSetWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkDataWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkGenericDataObjectReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkGenericDataObjectWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkGraphReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkGraphWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkPixelExtentIO.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkPolyDataReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkPolyDataWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkRectilinearGridReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkRectilinearGridWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkSimplePointsReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkSimplePointsWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkStructuredGridReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkStructuredGridWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkStructuredPointsReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkStructuredPointsWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkTableReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkTableWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkTreeReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkTreeWriter.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkUnstructuredGridReader.h"
    "/home/ezequiel/VTK/IO/Legacy/vtkUnstructuredGridWriter.h"
    "/home/ezequiel/VTK/build/IO/Legacy/vtkIOLegacyModule.h"
    )
endif()

