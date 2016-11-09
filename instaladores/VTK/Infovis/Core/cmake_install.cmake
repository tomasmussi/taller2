# Install script for directory: /home/ezequiel/VTK/Infovis/Core

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkInfovisCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkInfovisCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInfovisCore-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Infovis/Core/CMakeFiles/vtkInfovisCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Infovis/Core/vtkAddMembershipArray.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkAdjacencyMatrixToEdgeTable.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkArrayNorm.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkArrayToTable.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkCollapseGraph.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkCollapseVerticesByArray.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkDataObjectToTable.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkDotProductSimilarity.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkExtractSelectedTree.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkEdgeCenters.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkExpandSelectedGraph.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkExtractSelectedGraph.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkGenerateIndexArray.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkGraphHierarchicalBundleEdges.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkGroupLeafVertices.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkMergeColumns.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkMergeGraphs.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkMergeTables.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkMutableGraphHelper.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkNetworkHierarchy.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkPipelineGraphSource.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkPruneTreeFilter.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkRandomGraphSource.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkReduceTable.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkRemoveIsolatedVertices.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkSparseArrayToTable.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkStreamGraph.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkStringToCategory.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkStringToNumeric.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTableToArray.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTableToGraph.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTableToSparseArray.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTableToTreeFilter.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkThresholdGraph.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkThresholdTable.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTransferAttributes.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTransposeMatrix.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTreeFieldAggregator.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTreeDifferenceFilter.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkTreeLevelsFilter.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkVertexDegree.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkRemoveHiddenData.h"
    "/home/ezequiel/VTK/Infovis/Core/vtkKCoreDecomposition.h"
    "/home/ezequiel/VTK/build/Infovis/Core/vtkInfovisCoreModule.h"
    )
endif()

