# Install script for directory: /home/ezequiel/VTK/IO/Image

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOImage-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOImage-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkIOImage-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkIOImage-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOImage-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOImage-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/IO/Image/CMakeFiles/vtkIOImage.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/IO/Image/vtkBMPReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkBMPWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkDEMReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkDICOMImageReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkGESignaReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageExport.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageImport.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageImportExecutive.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageReader2.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageReader2Collection.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageReader2Factory.h"
    "/home/ezequiel/VTK/IO/Image/vtkImageWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkJPEGReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkJPEGWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkJSONImageWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkMedicalImageProperties.h"
    "/home/ezequiel/VTK/IO/Image/vtkMedicalImageReader2.h"
    "/home/ezequiel/VTK/IO/Image/vtkMetaImageReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkMetaImageWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkNIFTIImageHeader.h"
    "/home/ezequiel/VTK/IO/Image/vtkNIFTIImageReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkNIFTIImageWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkNrrdReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkPNGReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkPNGWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkPNMReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkPNMWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkPostScriptWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkSLCReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkTIFFReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkTIFFWriter.h"
    "/home/ezequiel/VTK/IO/Image/vtkVolume16Reader.h"
    "/home/ezequiel/VTK/IO/Image/vtkVolumeReader.h"
    "/home/ezequiel/VTK/IO/Image/vtkMRCReader.h"
    "/home/ezequiel/VTK/build/IO/Image/vtkIOImageModule.h"
    )
endif()

