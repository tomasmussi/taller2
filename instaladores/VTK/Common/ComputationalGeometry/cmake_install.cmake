# Install script for directory: /home/ezequiel/VTK/Common/ComputationalGeometry

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonComputationalGeometry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonComputationalGeometry-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkCommonComputationalGeometry-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkCommonComputationalGeometry-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonComputationalGeometry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonComputationalGeometry-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Common/ComputationalGeometry/CMakeFiles/vtkCommonComputationalGeometry.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkCardinalSpline.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkKochanekSpline.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricBoy.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricConicSpiral.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricCrossCap.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricDini.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricEllipsoid.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricEnneper.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricFigure8Klein.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricFunction.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricKlein.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricMobius.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricRandomHills.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricRoman.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricSpline.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricSuperEllipsoid.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricSuperToroid.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricTorus.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricKuen.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricPseudosphere.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricBohemianDome.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricHenneberg.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricCatalanMinimal.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricBour.h"
    "/home/ezequiel/VTK/Common/ComputationalGeometry/vtkParametricPluckerConoid.h"
    "/home/ezequiel/VTK/build/Common/ComputationalGeometry/vtkCommonComputationalGeometryModule.h"
    )
endif()

