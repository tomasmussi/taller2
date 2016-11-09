# Install script for directory: /home/ezequiel/VTK/Filters/Geometry

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeometry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeometry-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersGeometry-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersGeometry-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeometry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeometry-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/Geometry/CMakeFiles/vtkFiltersGeometry.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/Geometry/vtkCompositeDataGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkHierarchicalDataSetGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkImageDataGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkImageDataToUniformGrid.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkLinearToQuadraticCellsFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkProjectSphereFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkRectilinearGridGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredGridGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredPointsGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkUnstructuredGridGeometryFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkDataSetSurfaceFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkDataSetRegionSurfaceFilter.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkAbstractGridConnectivity.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkDataSetGhostGenerator.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkRectilinearGridPartitioner.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredAMRNeighbor.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredAMRGridConnectivity.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredGridConnectivity.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredGridGhostDataGenerator.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredGridPartitioner.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkStructuredNeighbor.h"
    "/home/ezequiel/VTK/Filters/Geometry/vtkUniformGridGhostDataGenerator.h"
    "/home/ezequiel/VTK/build/Filters/Geometry/vtkFiltersGeometryModule.h"
    )
endif()

