# Install script for directory: /home/ezequiel/VTK

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/build/CMakeFiles/VTKConfig.cmake"
    "/home/ezequiel/VTK/build/VTKConfigVersion.cmake"
    "/home/ezequiel/VTK/CMake/vtkexportheader.cmake.in"
    "/home/ezequiel/VTK/CMake/VTKGenerateExportHeader.cmake"
    "/home/ezequiel/VTK/CMake/pythonmodules.h.in"
    "/home/ezequiel/VTK/CMake/UseVTK.cmake"
    "/home/ezequiel/VTK/CMake/FindTCL.cmake"
    "/home/ezequiel/VTK/CMake/TopologicalSort.cmake"
    "/home/ezequiel/VTK/CMake/vtkTclTkMacros.cmake"
    "/home/ezequiel/VTK/CMake/vtk-forward.c.in"
    "/home/ezequiel/VTK/CMake/vtkGroups.cmake"
    "/home/ezequiel/VTK/CMake/vtkForwardingExecutable.cmake"
    "/home/ezequiel/VTK/CMake/vtkJavaWrapping.cmake"
    "/home/ezequiel/VTK/CMake/vtkMakeInstantiator.cmake"
    "/home/ezequiel/VTK/CMake/vtkMakeInstantiator.cxx.in"
    "/home/ezequiel/VTK/CMake/vtkMakeInstantiator.h.in"
    "/home/ezequiel/VTK/CMake/vtkModuleAPI.cmake"
    "/home/ezequiel/VTK/CMake/vtkModuleHeaders.cmake.in"
    "/home/ezequiel/VTK/CMake/vtkModuleInfo.cmake.in"
    "/home/ezequiel/VTK/CMake/vtkModuleMacros.cmake"
    "/home/ezequiel/VTK/CMake/vtkModuleMacrosPython.cmake"
    "/home/ezequiel/VTK/CMake/vtkMPI.cmake"
    "/home/ezequiel/VTK/CMake/vtkExternalModuleMacros.cmake"
    "/home/ezequiel/VTK/CMake/vtkObjectFactory.cxx.in"
    "/home/ezequiel/VTK/CMake/vtkObjectFactory.h.in"
    "/home/ezequiel/VTK/CMake/vtkPythonPackages.cmake"
    "/home/ezequiel/VTK/CMake/vtkPythonWrapping.cmake"
    "/home/ezequiel/VTK/CMake/vtkTclWrapping.cmake"
    "/home/ezequiel/VTK/CMake/vtkThirdParty.cmake"
    "/home/ezequiel/VTK/CMake/vtkWrapHierarchy.cmake"
    "/home/ezequiel/VTK/CMake/vtkWrapJava.cmake"
    "/home/ezequiel/VTK/CMake/vtkWrapperInit.data.in"
    "/home/ezequiel/VTK/CMake/vtkWrapping.cmake"
    "/home/ezequiel/VTK/CMake/vtkWrapPython.cmake"
    "/home/ezequiel/VTK/CMake/vtkWrapPythonSIP.cmake"
    "/home/ezequiel/VTK/CMake/vtkWrapPython.sip.in"
    "/home/ezequiel/VTK/CMake/vtkWrapTcl.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/VTKTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/VTKTargets.cmake"
         "/home/ezequiel/VTK/build/CMakeFiles/Export/lib/cmake/vtk-7.1/VTKTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/VTKTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/VTKTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1" TYPE FILE FILES "/home/ezequiel/VTK/build/CMakeFiles/Export/lib/cmake/vtk-7.1/VTKTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1" TYPE FILE FILES "/home/ezequiel/VTK/build/CMakeFiles/Export/lib/cmake/vtk-7.1/VTKTargets-debug.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ezequiel/VTK/build/Remote/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Utilities/KWIML/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Utilities/KWSys/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Math/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Misc/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/System/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Transforms/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/DataModel/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Color/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/ExecutionModel/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/ComputationalGeometry/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/General/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Fourier/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/alglib/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Statistics/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Extraction/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Infovis/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Geometry/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Sources/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/zlib/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/freetype/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/FreeType/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Context2D/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Charts/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Legacy/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/expat/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/XMLParser/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/XML/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/libxml2/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Infovis/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Utilities/DICOMParser/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Utilities/MetaIO/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/jpeg/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/png/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/tiff/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Image/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Utilities/EncodeString/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/glew/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/OpenGL2/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/ContextOpenGL2/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Testing/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Testing/Rendering/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Sources/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Hybrid/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Modeling/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Color/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/General/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Hybrid/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Interaction/Style/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Annotation/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Volume/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Interaction/Widgets/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Views/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Views/Context2D/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Charts/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Color/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/ComputationalGeometry/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Generic/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Geometry/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Testing/GenericBridge/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/DataModel/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/ExecutionModel/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Math/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Misc/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/System/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Common/Transforms/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Domains/Chemistry/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Domains/ChemistryOpenGL2/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Domains/Chemistry/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Domains/ChemistryOpenGL2/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Utilities/HashSource/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Parallel/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/AMR/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/hdf5/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/AMR/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/AMR/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Math/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/VolumeOpenGL2/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/netcdf/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/exodusII/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Exodus/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Extraction/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/FlowPaths/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Imaging/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/FlowPaths/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Label/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/General/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Generic/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Geometry/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Stencil/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Hybrid/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/HyperTree/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/HyperTree/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Modeling/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Parallel/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/ParallelImaging/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Points/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Points/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Programmable/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Programmable/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/SMP/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/SMP/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Selection/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Selection/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/NetCDF/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/jsoncpp/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Parallel/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Sources/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Statistics/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Texture/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/verdict/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Verdict/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Filters/Verdict/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Infovis/Layout/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/libproj4/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Geovis/Core/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/AMR/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/EnSight/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Exodus/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/gl2ps/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/GL2PSOpenGL2/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Export/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Geometry/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Interaction/Image/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Image/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Import/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Import/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Infovis/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/LSDyna/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/LSDyna/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Legacy/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/MINC/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/oggtheora/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Movie/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Movie/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/NetCDF/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/PLY/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/PLY/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/ParallelXML/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/ThirdParty/sqlite/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/SQL/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Testing/IOSQL/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/SQL/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/TecplotTable/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/TecplotTable/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/Video/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/IO/XML/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Statistics/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Image/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Hybrid/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Morphological/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Imaging/Morphological/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Infovis/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Infovis/Layout/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/LOD/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Interaction/Widgets/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Parallel/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Annotation/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Context2D/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Core/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/FreeType/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/GL2PSOpenGL2/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Image/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/LOD/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Label/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/OpenGL2/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Rendering/Volume/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Views/Infovis/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Views/Infovis/Testing/Cxx/cmake_install.cmake")
  include("/home/ezequiel/VTK/build/Testing/Install/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ezequiel/VTK/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
