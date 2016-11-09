# Install script for directory: /home/ezequiel/VTK/Rendering/Volume

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingVolume-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingVolume-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkRenderingVolume-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkRenderingVolume-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingVolume-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingVolume-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Rendering/Volume/CMakeFiles/vtkRenderingVolume.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Rendering/Volume/vtkDirectionEncoder.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkEncodedGradientEstimator.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkEncodedGradientShader.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFiniteDifferenceGradientEstimator.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointRayCastImage.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOHelper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeHelper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointVolumeRayCastCompositeShadeHelper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointVolumeRayCastHelper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointVolumeRayCastMIPHelper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkFixedPointVolumeRayCastMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkGPUVolumeRayCastMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkOSPRayVolumeInterface.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkProjectedTetrahedraMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkRayCastImageDisplayHelper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkRecursiveSphereDirectionEncoder.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkSphericalDirectionEncoder.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridBunykRayCastFunction.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridHomogeneousRayIntegrator.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridLinearRayIntegrator.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridPartialPreIntegration.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridPreIntegration.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridVolumeMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridVolumeRayCastFunction.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridVolumeRayCastIterator.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridVolumeRayCastMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridVolumeRayIntegrator.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkUnstructuredGridVolumeZSweepMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeOutlineSource.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumePicker.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeRayCastCompositeFunction.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeRayCastFunction.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeRayCastIsosurfaceFunction.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeRayCastMIPFunction.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeRayCastMapper.h"
    "/home/ezequiel/VTK/Rendering/Volume/vtkVolumeRayCastSpaceLeapingImageFilter.h"
    "/home/ezequiel/VTK/build/Rendering/Volume/vtkRenderingVolumeModule.h"
    )
endif()

