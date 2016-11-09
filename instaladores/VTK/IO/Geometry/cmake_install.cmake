# Install script for directory: /home/ezequiel/VTK/IO/Geometry

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOGeometry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOGeometry-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkIOGeometry-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkIOGeometry-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOGeometry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOGeometry-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/IO/Geometry/CMakeFiles/vtkIOGeometry.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/IO/Geometry/vtkAVSucdReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkBYUReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkBYUWriter.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkChacoReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkFacetWriter.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkFLUENTReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkGAMBITReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkGaussianCubeReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkHoudiniPolyDataWriter.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkIVWriter.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkMCubesReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkMCubesWriter.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkMFIXReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkMoleculeReaderBase.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkOBJReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkOpenFOAMReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkParticleReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkPDBReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkProStarReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkPTSReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkSTLReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkSTLWriter.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkTecplotReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkUGFacetReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkWindBladeReader.h"
    "/home/ezequiel/VTK/IO/Geometry/vtkXYZMolReader.h"
    "/home/ezequiel/VTK/build/IO/Geometry/vtkIOGeometryModule.h"
    )
endif()

