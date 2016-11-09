# Install script for directory: /home/ezequiel/VTK/Rendering/OpenGL2

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingOpenGL2-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingOpenGL2-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkRenderingOpenGL2-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkRenderingOpenGL2-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingOpenGL2-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingOpenGL2-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Rendering/OpenGL2/CMakeFiles/vtkRenderingOpenGL2.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGL.h"
    "/home/ezequiel/VTK/build/Rendering/OpenGL2/vtkTDxConfigure.h"
    "/home/ezequiel/VTK/build/Rendering/OpenGL2/vtkOpenGLError.h"
    "/home/ezequiel/VTK/build/Rendering/OpenGL2/vtkRenderingOpenGLConfigure.h"
    "/home/ezequiel/VTK/build/Rendering/OpenGL2/vtkRenderingOpenGL2ObjectFactory.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkCameraPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkClearRGBPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkClearZPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkCompositePolyDataMapper2.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkDefaultPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkDepthOfFieldPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkDepthImageProcessingPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkDepthPeelingPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkDualDepthPeelingPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkEDLShading.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkFrameBufferObject.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkFrameBufferObject2.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkGaussianBlurPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkGenericOpenGLRenderWindow.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkHiddenLineRemovalPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkImageProcessingPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkLightingMapPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkLightsPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpaquePass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLActor.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLBillboardTextActor3D.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLBufferObject.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLCamera.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLFXAAFilter.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLGL2PSHelper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLGlyph3DHelper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLGlyph3DMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLHardwareSelector.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLHelper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLImageAlgorithmHelper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLImageMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLImageSliceMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLIndexBufferObject.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLLabeledContourMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLLight.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLPointGaussianMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLPolyDataMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLPolyDataMapper2D.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLProperty.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLRenderPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLRenderTimer.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLRenderUtilities.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLRenderWindow.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLRenderer.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLShaderCache.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLSphereMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLStickMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLTextActor.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLTextActor3D.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLTextMapper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLTexture.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLVertexArrayObject.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOpenGLVertexBufferObject.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkOverlayPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkPixelBufferObject.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkPointFillPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkRenderPassCollection.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkRenderStepsPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkRenderbuffer.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkSSAAPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkSequencePass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkShader.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkShaderProgram.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkShadowMapBakerPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkShadowMapPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkSobelGradientMagnitudePass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkTextureObject.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkTextureUnitManager.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkTransformFeedback.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkTranslucentPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkValuePass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkValuePassHelper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkVolumetricPass.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkDataTransferHelper.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkDummyGPUInfoList.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkXRenderWindowInteractor.h"
    "/home/ezequiel/VTK/Rendering/OpenGL2/vtkXOpenGLRenderWindow.h"
    "/home/ezequiel/VTK/build/Rendering/OpenGL2/vtkRenderingOpenGL2Module.h"
    )
endif()

