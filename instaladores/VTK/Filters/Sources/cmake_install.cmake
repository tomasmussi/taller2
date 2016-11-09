# Install script for directory: /home/ezequiel/VTK/Filters/Sources

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersSources-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersSources-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkFiltersSources-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkFiltersSources-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersSources-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkFiltersSources-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Filters/Sources/CMakeFiles/vtkFiltersSources.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Filters/Sources/vtkArcSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkArrowSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkButtonSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkConeSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkCubeSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkCylinderSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkDiskSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkEllipseArcSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkEllipticalButtonSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkFrustumSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkGlyphSource2D.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkHyperOctreeFractalSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkHyperTreeGridSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkLineSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkOutlineCornerFilter.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkOutlineCornerSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkOutlineSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkParametricFunctionSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkPlaneSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkPlatonicSolidSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkPointSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkPolyLineSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkProgrammableDataObjectSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkProgrammableSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkRectangularButtonSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkRegularPolygonSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkSelectionSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkSphereSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkSuperquadricSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkTessellatedBoxSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkTextSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkTexturedSphereSource.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkGraphToPolyData.h"
    "/home/ezequiel/VTK/Filters/Sources/vtkDiagonalMatrixSource.h"
    "/home/ezequiel/VTK/build/Filters/Sources/vtkFiltersSourcesModule.h"
    )
endif()

