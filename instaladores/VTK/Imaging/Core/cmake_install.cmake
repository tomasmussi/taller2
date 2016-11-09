# Install script for directory: /home/ezequiel/VTK/Imaging/Core

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkImagingCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkImagingCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkImagingCore-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Imaging/Core/CMakeFiles/vtkImagingCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Imaging/Core/vtkExtractVOI.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageAppendComponents.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageBlend.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageCacheFilter.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageCast.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageChangeInformation.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageClip.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageConstantPad.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageDataStreamer.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageDecomposeFilter.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageDifference.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageExtractComponents.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageFlip.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageIterateFilter.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageMagnify.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageMapToColors.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageMask.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageMirrorPad.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImagePadFilter.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImagePermute.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImagePointDataIterator.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImagePointIterator.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageResample.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageReslice.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageResliceToColors.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageShiftScale.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageShrink3D.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageStencilIterator.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageThreshold.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageTranslateExtent.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageWrapPad.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkRTAnalyticSource.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageResize.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageBSplineCoefficients.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageStencilData.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageStencilAlgorithm.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkAbstractImageInterpolator.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageBSplineInternals.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageBSplineInterpolator.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageSincInterpolator.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageInterpolator.h"
    "/home/ezequiel/VTK/Imaging/Core/vtkImageStencilSource.h"
    "/home/ezequiel/VTK/build/Imaging/Core/vtkImagingCoreModule.h"
    )
endif()

