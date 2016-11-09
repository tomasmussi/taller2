# Install script for directory: /home/ezequiel/VTK/Filters/Statistics

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersStatistics-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersStatistics-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersStatistics-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersStatistics-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersStatistics-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersStatistics-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/Statistics/CMakeFiles/vtkFiltersStatistics.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/Statistics/vtkAutoCorrelativeStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkBivariateLinearTableThreshold.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkComputeQuartiles.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkContingencyStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkCorrelativeStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkDescriptiveStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkHighestDensityRegionsStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkExtractFunctionalBagPlot.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkKMeansDistanceFunctorCalculator.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkKMeansDistanceFunctor.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkKMeansStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkMultiCorrelativeStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkOrderStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkPCAStatistics.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkStatisticsAlgorithm.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkStrahlerMetric.h"
    "/home/ezequiel/VTK/Filters/Statistics/vtkStreamingStatistics.h"
    "/home/ezequiel/VTK/build/Filters/Statistics/vtkFiltersStatisticsModule.h"
    )
endif()

