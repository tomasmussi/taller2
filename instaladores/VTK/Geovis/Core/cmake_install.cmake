# Install script for directory: /home/ezequiel/VTK/Geovis/Core

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkGeovisCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkGeovisCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkGeovisCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkGeovisCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkGeovisCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkGeovisCore-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Geovis/Core/CMakeFiles/vtkGeovisCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Geovis/Core/vtkCompassRepresentation.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkCompassWidget.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoAdaptiveArcs.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoAlignedImageSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoArcs.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoAssignCoordinates.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoCamera.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoFileImageSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoFileTerrainSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoGlobeSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoGraticule.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoImageNode.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoInteractorStyle.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoProjection.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoProjectionSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoRandomGraphSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoSampleArcs.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoSphereTransform.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoTerrain.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoTerrain2D.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoTerrainNode.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoTransform.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoTreeNode.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoTreeNodeCache.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGlobeSource.h"
    "/home/ezequiel/VTK/Geovis/Core/vtkGeoAlignedImageRepresentation.h"
    "/home/ezequiel/VTK/build/Geovis/Core/vtkGeovisCoreModule.h"
    )
endif()

