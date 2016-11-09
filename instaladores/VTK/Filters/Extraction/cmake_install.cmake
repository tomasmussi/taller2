# Install script for directory: /home/ezequiel/VTK/Filters/Extraction

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersExtraction-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersExtraction-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersExtraction-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersExtraction-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersExtraction-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersExtraction-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/Extraction/CMakeFiles/vtkFiltersExtraction.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/Extraction/vtkConvertSelection.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractArraysOverTime.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractBlock.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractCells.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractDataOverTime.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractDataSets.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractEdges.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractGeometry.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractGrid.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractLevel.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractPolyDataGeometry.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractRectilinearGrid.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractSelectedBlock.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractSelectedIds.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractSelectedLocations.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractSelectedPolyDataIds.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractSelectedRows.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractSelectedThresholds.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractSelection.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractTemporalFieldData.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractTensorComponents.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractTimeSteps.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractUnstructuredGrid.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkExtractVectorComponents.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkProbeSelectedLocations.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkHierarchicalDataExtractDataSets.h"
    "/home/ezequiel/VTK/Filters/Extraction/vtkHierarchicalDataExtractLevel.h"
    "/home/ezequiel/VTK/build/Filters/Extraction/vtkFiltersExtractionModule.h"
    )
endif()

