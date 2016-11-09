# Install script for directory: /home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkmetaio-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkmetaio-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkmetaio-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkmetaio-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkmetaio-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkmetaio-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1/vtkmetaio" TYPE FILE FILES
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaITKUtils.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaContour.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaMesh.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaDTITube.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/localMetaConfiguration.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaTube.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaLandmark.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaTypes.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaCommand.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaImage.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaEllipse.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaObject.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaFEMObject.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaSurface.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaTubeGraph.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaScene.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaLine.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaUtils.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaBlob.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaImageUtils.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaTransform.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaEvent.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaGroup.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaGaussian.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaVesselTube.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaArrow.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaArray.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaImageTypes.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaForm.h"
    "/home/ezequiel/VTK/Utilities/MetaIO/vtkmetaio/metaOutput.h"
    "/home/ezequiel/VTK/build/Utilities/MetaIO/vtkmetaio/metaIOConfig.h"
    )
endif()

