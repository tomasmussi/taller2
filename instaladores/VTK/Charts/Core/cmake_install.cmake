# Install script for directory: /home/ezequiel/VTK/Charts/Core

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkChartsCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkChartsCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkChartsCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkChartsCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkChartsCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkChartsCore-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Charts/Core/CMakeFiles/vtkChartsCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Charts/Core/vtkAxis.h"
    "/home/ezequiel/VTK/Charts/Core/vtkAxisExtended.h"
    "/home/ezequiel/VTK/Charts/Core/vtkCategoryLegend.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChart.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartBox.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartHistogram2D.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartLegend.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartMatrix.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartParallelCoordinates.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartPie.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartXY.h"
    "/home/ezequiel/VTK/Charts/Core/vtkChartXYZ.h"
    "/home/ezequiel/VTK/Charts/Core/vtkColorLegend.h"
    "/home/ezequiel/VTK/Charts/Core/vtkColorTransferControlPointsItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkColorTransferFunctionItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkCompositeControlPointsItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkCompositeTransferFunctionItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkContextArea.h"
    "/home/ezequiel/VTK/Charts/Core/vtkContextPolygon.h"
    "/home/ezequiel/VTK/Charts/Core/vtkControlPointsItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkLookupTableItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPiecewiseControlPointsItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPiecewiseFunctionItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPiecewisePointHandleItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlot.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlot3D.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotArea.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotBag.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotBar.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotBox.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotFunctionalBag.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotGrid.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotHistogram2D.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotLine.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotLine3D.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotParallelCoordinates.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotPie.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotPoints.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotPoints3D.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotStacked.h"
    "/home/ezequiel/VTK/Charts/Core/vtkPlotSurface.h"
    "/home/ezequiel/VTK/Charts/Core/vtkScalarsToColorsItem.h"
    "/home/ezequiel/VTK/Charts/Core/vtkScatterPlotMatrix.h"
    "/home/ezequiel/VTK/build/Charts/Core/vtkChartsCoreModule.h"
    )
endif()

