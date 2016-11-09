# Install script for directory: /home/ezequiel/VTK/Filters/Core

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersCore-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/Core/CMakeFiles/vtkFiltersCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/Core/vtkAppendFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkAppendPolyData.h"
    "/home/ezequiel/VTK/Filters/Core/vtkAppendSelection.h"
    "/home/ezequiel/VTK/Filters/Core/vtkArrayCalculator.h"
    "/home/ezequiel/VTK/Filters/Core/vtkAssignAttribute.h"
    "/home/ezequiel/VTK/Filters/Core/vtkAttributeDataToFieldDataFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkBinCellDataFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkCellDataToPointData.h"
    "/home/ezequiel/VTK/Filters/Core/vtkCleanPolyData.h"
    "/home/ezequiel/VTK/Filters/Core/vtkClipPolyData.h"
    "/home/ezequiel/VTK/Filters/Core/vtkCompositeDataProbeFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkConnectivityFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkContourFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkContourGrid.h"
    "/home/ezequiel/VTK/Filters/Core/vtkContourHelper.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDataObjectGenerator.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDataObjectToDataSetFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDataSetEdgeSubdivisionCriterion.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDataSetToDataObjectFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDecimatePolylineFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDecimatePro.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDelaunay2D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkDelaunay3D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkElevationFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkExecutionTimer.h"
    "/home/ezequiel/VTK/Filters/Core/vtkFeatureEdges.h"
    "/home/ezequiel/VTK/Filters/Core/vtkFieldDataToAttributeDataFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkFlyingEdges2D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkFlyingEdges3D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkFlyingEdgesPlaneCutter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkGlyph2D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkGlyph3D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkHedgeHog.h"
    "/home/ezequiel/VTK/Filters/Core/vtkHull.h"
    "/home/ezequiel/VTK/Filters/Core/vtkIdFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMarchingCubes.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMarchingSquares.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMaskFields.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMaskPoints.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMaskPolyData.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMassProperties.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMergeDataObjectFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMergeFields.h"
    "/home/ezequiel/VTK/Filters/Core/vtkMergeFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkPointDataToCellData.h"
    "/home/ezequiel/VTK/Filters/Core/vtkPolyDataConnectivityFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkPolyDataNormals.h"
    "/home/ezequiel/VTK/Filters/Core/vtkProbeFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkQuadricClustering.h"
    "/home/ezequiel/VTK/Filters/Core/vtkQuadricDecimation.h"
    "/home/ezequiel/VTK/Filters/Core/vtkRearrangeFields.h"
    "/home/ezequiel/VTK/Filters/Core/vtkResampleToImage.h"
    "/home/ezequiel/VTK/Filters/Core/vtkResampleWithDataSet.h"
    "/home/ezequiel/VTK/Filters/Core/vtkReverseSense.h"
    "/home/ezequiel/VTK/Filters/Core/vtkSimpleElevationFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkSmoothPolyDataFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkStripper.h"
    "/home/ezequiel/VTK/Filters/Core/vtkStructuredGridOutlineFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkSynchronizedTemplates2D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkSynchronizedTemplates3D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkSynchronizedTemplatesCutter3D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkTensorGlyph.h"
    "/home/ezequiel/VTK/Filters/Core/vtkThreshold.h"
    "/home/ezequiel/VTK/Filters/Core/vtkThresholdPoints.h"
    "/home/ezequiel/VTK/Filters/Core/vtkTransposeTable.h"
    "/home/ezequiel/VTK/Filters/Core/vtkTriangleFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkTubeFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkUnstructuredGridQuadricDecimation.h"
    "/home/ezequiel/VTK/Filters/Core/vtkVectorDot.h"
    "/home/ezequiel/VTK/Filters/Core/vtkVectorNorm.h"
    "/home/ezequiel/VTK/Filters/Core/vtkWindowedSincPolyDataFilter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkCutter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkCompositeCutter.h"
    "/home/ezequiel/VTK/Filters/Core/vtkGridSynchronizedTemplates3D.h"
    "/home/ezequiel/VTK/Filters/Core/vtkRectilinearSynchronizedTemplates.h"
    "/home/ezequiel/VTK/Filters/Core/vtkEdgeSubdivisionCriterion.h"
    "/home/ezequiel/VTK/Filters/Core/vtkStreamingTessellator.h"
    "/home/ezequiel/VTK/Filters/Core/vtkImplicitPolyDataDistance.h"
    "/home/ezequiel/VTK/Filters/Core/vtkStreamerBase.h"
    "/home/ezequiel/VTK/Filters/Core/vtkCenterOfMass.h"
    "/home/ezequiel/VTK/Filters/Core/vtkImageAppend.h"
    "/home/ezequiel/VTK/Filters/Core/vtkStructuredGridAppend.h"
    "/home/ezequiel/VTK/Filters/Core/vtkAppendCompositeDataLeaves.h"
    "/home/ezequiel/VTK/build/Filters/Core/vtkFiltersCoreModule.h"
    )
endif()

