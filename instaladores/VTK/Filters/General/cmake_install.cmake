# Install script for directory: /home/ezequiel/VTK/Filters/General

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeneral-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeneral-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersGeneral-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersGeneral-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeneral-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersGeneral-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/General/CMakeFiles/vtkFiltersGeneral.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/General/vtkAnnotationLink.h"
    "/home/ezequiel/VTK/Filters/General/vtkAppendPoints.h"
    "/home/ezequiel/VTK/Filters/General/vtkApproximatingSubdivisionFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkAreaContourSpectrumFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkAxes.h"
    "/home/ezequiel/VTK/Filters/General/vtkBlankStructuredGrid.h"
    "/home/ezequiel/VTK/Filters/General/vtkBlankStructuredGridWithImage.h"
    "/home/ezequiel/VTK/Filters/General/vtkBlockIdScalars.h"
    "/home/ezequiel/VTK/Filters/General/vtkBoxClipDataSet.h"
    "/home/ezequiel/VTK/Filters/General/vtkBrownianPoints.h"
    "/home/ezequiel/VTK/Filters/General/vtkCellCenters.h"
    "/home/ezequiel/VTK/Filters/General/vtkCellDerivatives.h"
    "/home/ezequiel/VTK/Filters/General/vtkClipClosedSurface.h"
    "/home/ezequiel/VTK/Filters/General/vtkClipConvexPolyData.h"
    "/home/ezequiel/VTK/Filters/General/vtkClipDataSet.h"
    "/home/ezequiel/VTK/Filters/General/vtkClipVolume.h"
    "/home/ezequiel/VTK/Filters/General/vtkCoincidentPoints.h"
    "/home/ezequiel/VTK/Filters/General/vtkContourTriangulator.h"
    "/home/ezequiel/VTK/Filters/General/vtkCountFaces.h"
    "/home/ezequiel/VTK/Filters/General/vtkCountVertices.h"
    "/home/ezequiel/VTK/Filters/General/vtkCursor2D.h"
    "/home/ezequiel/VTK/Filters/General/vtkCursor3D.h"
    "/home/ezequiel/VTK/Filters/General/vtkCurvatures.h"
    "/home/ezequiel/VTK/Filters/General/vtkDataSetGradient.h"
    "/home/ezequiel/VTK/Filters/General/vtkDataSetGradientPrecompute.h"
    "/home/ezequiel/VTK/Filters/General/vtkDataSetTriangleFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkDeformPointSet.h"
    "/home/ezequiel/VTK/Filters/General/vtkDensifyPolyData.h"
    "/home/ezequiel/VTK/Filters/General/vtkDicer.h"
    "/home/ezequiel/VTK/Filters/General/vtkDiscreteMarchingCubes.h"
    "/home/ezequiel/VTK/Filters/General/vtkEdgePoints.h"
    "/home/ezequiel/VTK/Filters/General/vtkExtractSelectedFrustum.h"
    "/home/ezequiel/VTK/Filters/General/vtkExtractSelectionBase.h"
    "/home/ezequiel/VTK/Filters/General/vtkGradientFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkGraphLayoutFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkGraphToPoints.h"
    "/home/ezequiel/VTK/Filters/General/vtkHierarchicalDataLevelFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkHyperStreamline.h"
    "/home/ezequiel/VTK/Filters/General/vtkIconGlyphFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkImageMarchingCubes.h"
    "/home/ezequiel/VTK/Filters/General/vtkInterpolateDataSetAttributes.h"
    "/home/ezequiel/VTK/Filters/General/vtkInterpolatingSubdivisionFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkLevelIdScalars.h"
    "/home/ezequiel/VTK/Filters/General/vtkLinkEdgels.h"
    "/home/ezequiel/VTK/Filters/General/vtkMergeCells.h"
    "/home/ezequiel/VTK/Filters/General/vtkMultiBlockDataGroupFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkMultiBlockFromTimeSeriesFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkMultiBlockMergeFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkMultiThreshold.h"
    "/home/ezequiel/VTK/Filters/General/vtkOBBDicer.h"
    "/home/ezequiel/VTK/Filters/General/vtkOBBTree.h"
    "/home/ezequiel/VTK/Filters/General/vtkPassThrough.h"
    "/home/ezequiel/VTK/Filters/General/vtkPointConnectivityFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkPolyDataStreamer.h"
    "/home/ezequiel/VTK/Filters/General/vtkPolyDataToReebGraphFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkProbePolyhedron.h"
    "/home/ezequiel/VTK/Filters/General/vtkQuadraturePointInterpolator.h"
    "/home/ezequiel/VTK/Filters/General/vtkQuadraturePointsGenerator.h"
    "/home/ezequiel/VTK/Filters/General/vtkQuadratureSchemeDictionaryGenerator.h"
    "/home/ezequiel/VTK/Filters/General/vtkQuantizePolyDataPoints.h"
    "/home/ezequiel/VTK/Filters/General/vtkRandomAttributeGenerator.h"
    "/home/ezequiel/VTK/Filters/General/vtkRectilinearGridClip.h"
    "/home/ezequiel/VTK/Filters/General/vtkRectilinearGridToTetrahedra.h"
    "/home/ezequiel/VTK/Filters/General/vtkRecursiveDividingCubes.h"
    "/home/ezequiel/VTK/Filters/General/vtkReflectionFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkRotationFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkSampleImplicitFunctionFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkShrinkFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkShrinkPolyData.h"
    "/home/ezequiel/VTK/Filters/General/vtkSpatialRepresentationFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkSplineFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkSplitByCellScalarFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkSplitField.h"
    "/home/ezequiel/VTK/Filters/General/vtkStructuredGridClip.h"
    "/home/ezequiel/VTK/Filters/General/vtkSubPixelPositionEdgels.h"
    "/home/ezequiel/VTK/Filters/General/vtkTableBasedClipDataSet.h"
    "/home/ezequiel/VTK/Filters/General/vtkTableToPolyData.h"
    "/home/ezequiel/VTK/Filters/General/vtkTableToStructuredGrid.h"
    "/home/ezequiel/VTK/Filters/General/vtkTemporalPathLineFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkTemporalStatistics.h"
    "/home/ezequiel/VTK/Filters/General/vtkTessellatorFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkTimeSourceExample.h"
    "/home/ezequiel/VTK/Filters/General/vtkTransformFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkTransformPolyDataFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkUncertaintyTubeFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkVertexGlyphFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkVolumeContourSpectrumFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkVoxelContoursToSurfaceFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkWarpLens.h"
    "/home/ezequiel/VTK/Filters/General/vtkWarpScalar.h"
    "/home/ezequiel/VTK/Filters/General/vtkWarpTo.h"
    "/home/ezequiel/VTK/Filters/General/vtkWarpVector.h"
    "/home/ezequiel/VTK/Filters/General/vtkYoungsMaterialInterface.h"
    "/home/ezequiel/VTK/Filters/General/vtkMarchingContourFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkRectilinearGridToPointSet.h"
    "/home/ezequiel/VTK/Filters/General/vtkGraphWeightEuclideanDistanceFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkGraphWeightFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkImageDataToPointSet.h"
    "/home/ezequiel/VTK/Filters/General/vtkIntersectionPolyDataFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkBooleanOperationPolyDataFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkDistancePolyDataFilter.h"
    "/home/ezequiel/VTK/Filters/General/vtkOverlappingAMRLevelIdScalars.h"
    "/home/ezequiel/VTK/Filters/General/vtkExtractArray.h"
    "/home/ezequiel/VTK/Filters/General/vtkMatricizeArray.h"
    "/home/ezequiel/VTK/Filters/General/vtkNormalizeMatrixVectors.h"
    "/home/ezequiel/VTK/Filters/General/vtkPassArrays.h"
    "/home/ezequiel/VTK/Filters/General/vtkSplitColumnComponents.h"
    "/home/ezequiel/VTK/Filters/General/vtkCellTreeLocator.h"
    "/home/ezequiel/VTK/build/Filters/General/vtkFiltersGeneralModule.h"
    )
endif()

