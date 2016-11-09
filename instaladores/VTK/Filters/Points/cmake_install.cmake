# Install script for directory: /home/ezequiel/VTK/Filters/Points

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersPoints-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersPoints-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersPoints-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersPoints-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersPoints-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersPoints-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/Points/CMakeFiles/vtkFiltersPoints.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/Points/vtkBoundedPointSource.h"
    "/home/ezequiel/VTK/Filters/Points/vtkDensifyPointCloudFilter.h"
    "/home/ezequiel/VTK/Filters/Points/vtkEllipsoidalGaussianKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkEuclideanClusterExtraction.h"
    "/home/ezequiel/VTK/Filters/Points/vtkExtractHierarchicalBins.h"
    "/home/ezequiel/VTK/Filters/Points/vtkExtractPointCloudPiece.h"
    "/home/ezequiel/VTK/Filters/Points/vtkExtractPoints.h"
    "/home/ezequiel/VTK/Filters/Points/vtkExtractSurface.h"
    "/home/ezequiel/VTK/Filters/Points/vtkFitImplicitFunction.h"
    "/home/ezequiel/VTK/Filters/Points/vtkGaussianKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkGeneralizedKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkHierarchicalBinningFilter.h"
    "/home/ezequiel/VTK/Filters/Points/vtkInterpolationKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkLinearKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkPCACurvatureEstimation.h"
    "/home/ezequiel/VTK/Filters/Points/vtkPCANormalEstimation.h"
    "/home/ezequiel/VTK/Filters/Points/vtkPointDensityFilter.h"
    "/home/ezequiel/VTK/Filters/Points/vtkPointCloudFilter.h"
    "/home/ezequiel/VTK/Filters/Points/vtkPointInterpolator.h"
    "/home/ezequiel/VTK/Filters/Points/vtkPointInterpolator2D.h"
    "/home/ezequiel/VTK/Filters/Points/vtkProbabilisticVoronoiKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkRadiusOutlierRemoval.h"
    "/home/ezequiel/VTK/Filters/Points/vtkSPHInterpolator.h"
    "/home/ezequiel/VTK/Filters/Points/vtkSPHCubicKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkSPHKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkSPHQuarticKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkSPHQuinticKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkShepardKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkSignedDistance.h"
    "/home/ezequiel/VTK/Filters/Points/vtkStatisticalOutlierRemoval.h"
    "/home/ezequiel/VTK/Filters/Points/vtkVoxelGrid.h"
    "/home/ezequiel/VTK/Filters/Points/vtkVoronoiKernel.h"
    "/home/ezequiel/VTK/Filters/Points/vtkWendlandQuinticKernel.h"
    "/home/ezequiel/VTK/build/Filters/Points/vtkFiltersPointsModule.h"
    )
endif()

