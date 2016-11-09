# Install script for directory: /home/ezequiel/VTK/Domains/Chemistry

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkDomainsChemistry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkDomainsChemistry-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkDomainsChemistry-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkDomainsChemistry-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkDomainsChemistry-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkDomainsChemistry-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Domains/Chemistry/CMakeFiles/vtkDomainsChemistry.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Domains/Chemistry/vtkBlueObeliskData.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkBlueObeliskDataInternal.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkBlueObeliskDataParser.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkCMLMoleculeReader.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkGaussianCubeReader2.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkMoleculeAlgorithm.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkMoleculeMapper.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkMoleculeToAtomBallFilter.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkMoleculeToBondStickFilter.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkMoleculeToPolyDataFilter.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkPeriodicTable.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkProgrammableElectronicData.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkProteinRibbonFilter.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkSimpleBondPerceiver.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkVASPAnimationReader.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkVASPTessellationReader.h"
    "/home/ezequiel/VTK/Domains/Chemistry/vtkXYZMolReader2.h"
    "/home/ezequiel/VTK/build/Domains/Chemistry/vtkDomainsChemistryModule.h"
    )
endif()

