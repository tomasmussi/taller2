# Install script for directory: /home/ezequiel/VTK/Imaging/General

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingGeneral-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingGeneral-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkImagingGeneral-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkImagingGeneral-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingGeneral-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingGeneral-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Imaging/General/CMakeFiles/vtkImagingGeneral.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Imaging/General/vtkImageAnisotropicDiffusion2D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageAnisotropicDiffusion3D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageCheckerboard.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageCityBlockDistance.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageConvolve.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageCorrelation.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageEuclideanDistance.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageEuclideanToPolar.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageGaussianSmooth.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageGradient.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageGradientMagnitude.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageHybridMedian2D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageLaplacian.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageMedian3D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageNormalize.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageRange3D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageSeparableConvolution.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageSobel2D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageSobel3D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageSpatialAlgorithm.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageVariance3D.h"
    "/home/ezequiel/VTK/Imaging/General/vtkSimpleImageFilterExample.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageSlab.h"
    "/home/ezequiel/VTK/Imaging/General/vtkImageSlabReslice.h"
    "/home/ezequiel/VTK/build/Imaging/General/vtkImagingGeneralModule.h"
    )
endif()

