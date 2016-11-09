# Install script for directory: /home/ezequiel/VTK/Parallel/Core

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkParallelCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkParallelCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkParallelCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkParallelCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkParallelCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkParallelCore-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Parallel/Core/CMakeFiles/vtkParallelCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Parallel/Core/vtkCommunicator.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkDummyCommunicator.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkDummyController.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkMultiProcessController.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkMultiProcessStream.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkPDirectory.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkProcess.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkProcessGroup.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkPSystemTools.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkSocketCommunicator.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkSocketController.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkSubCommunicator.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkSubGroup.h"
    "/home/ezequiel/VTK/Parallel/Core/vtkFieldDataSerializer.h"
    "/home/ezequiel/VTK/build/Parallel/Core/vtkParallelCoreModule.h"
    )
endif()

