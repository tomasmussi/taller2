# Install script for directory: /home/ezequiel/VTK/Infovis/Layout

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisLayout-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisLayout-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkInfovisLayout-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkInfovisLayout-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisLayout-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisLayout-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Infovis/Layout/CMakeFiles/vtkInfovisLayout.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Infovis/Layout/vtkArcParallelEdgeStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkAreaLayout.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkAreaLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkAssignCoordinates.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkAssignCoordinatesLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkAttributeClustering2DLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkBoxLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkCirclePackFrontChainLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkCirclePackLayout.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkCirclePackLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkCirclePackToPolyData.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkCircularLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkClustering2DLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkCommunity2DLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkConeLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkConstrained2DLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkCosmicTreeLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkEdgeLayout.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkEdgeLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkFast2DLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkForceDirectedLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkGeoEdgeStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkGeoMath.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkGraphLayout.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkGraphLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkIncrementalForceLayout.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkPassThroughEdgeStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkPassThroughLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkPerturbCoincidentVertices.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkRandomLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkSimple2DLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkSimple3DCirclesStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkSliceAndDiceLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkSpanTreeLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkSplineGraphEdges.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkSquarifyLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkStackedTreeLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkTreeLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkTreeMapLayout.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkTreeMapLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkTreeMapToPolyData.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkTreeOrbitLayoutStrategy.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkTreeRingToPolyData.h"
    "/home/ezequiel/VTK/Infovis/Layout/vtkKCoreLayout.h"
    "/home/ezequiel/VTK/build/Infovis/Layout/vtkInfovisLayoutModule.h"
    )
endif()

