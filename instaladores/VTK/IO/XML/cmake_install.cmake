# Install script for directory: /home/ezequiel/VTK/IO/XML

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOXML-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOXML-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkIOXML-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkIOXML-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOXML-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkIOXML-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/IO/XML/CMakeFiles/vtkIOXML.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/IO/XML/vtkRTXMLPolyDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLCompositeDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLCompositeDataWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLDataSetWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLFileReadTester.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLGenericDataObjectReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLHierarchicalBoxDataFileConverter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLHierarchicalBoxDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLHierarchicalBoxDataWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLHierarchicalDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLHyperOctreeReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLHyperOctreeWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLImageDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLImageDataWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLMultiBlockDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLMultiBlockDataWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLMultiGroupDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPImageDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPolyDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPolyDataWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPPolyDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPRectilinearGridReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPStructuredDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPStructuredGridReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPUnstructuredDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLPUnstructuredGridReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLRectilinearGridReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLRectilinearGridWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLStructuredDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLStructuredDataWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLStructuredGridReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLStructuredGridWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLUniformGridAMRReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLUniformGridAMRWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLUnstructuredDataReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLUnstructuredDataWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLUnstructuredGridReader.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLUnstructuredGridWriter.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLWriterC.h"
    "/home/ezequiel/VTK/IO/XML/vtkXMLWriter.h"
    "/home/ezequiel/VTK/build/IO/XML/vtkIOXMLModule.h"
    )
endif()

