# Install script for directory: /home/ezequiel/VTK/Filters/Parallel

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersParallel-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersParallel-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersParallel-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersParallel-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersParallel-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersParallel-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/Parallel/CMakeFiles/vtkFiltersParallel.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/Parallel/vtkAngularPeriodicFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkCollectGraph.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkCollectPolyData.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkCollectTable.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkCutMaterial.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkDuplicatePolyData.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkExtractCTHPart.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkExtractPolyDataPiece.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkExtractUnstructuredGridPiece.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkExtractUserDefinedPiece.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPCellDataToPointData.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPExtractArraysOverTime.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPeriodicFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPKdTree.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPLinearExtrusionFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPMaskPoints.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPOutlineCornerFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPOutlineFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPOutlineFilterInternals.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPPolyDataNormals.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPProbeFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPProjectSphereFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPReflectionFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPResampleFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPSphereSource.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPYoungsMaterialInterface.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPassThroughFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPieceRequestFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPieceScalars.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkPipelineSize.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkProcessIdScalars.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkRectilinearGridOutlineFilter.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkTransmitPolyDataPiece.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkTransmitStructuredDataPiece.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkTransmitRectilinearGridPiece.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkTransmitStructuredGridPiece.h"
    "/home/ezequiel/VTK/Filters/Parallel/vtkTransmitUnstructuredGridPiece.h"
    "/home/ezequiel/VTK/build/Filters/Parallel/vtkFiltersParallelModule.h"
    )
endif()

