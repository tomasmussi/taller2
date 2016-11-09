# Install script for directory: /home/ezequiel/VTK/Rendering/Core

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkRenderingCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkRenderingCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkRenderingCore-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Rendering/Core/CMakeFiles/vtkRenderingCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Rendering/Core/vtkGPUInfoListArray.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkNoise200x200.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPythagoreanQuadruples.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRayCastStructures.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderingCoreEnums.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTDxMotionEventInfo.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAbstractMapper3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAbstractMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAbstractPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAbstractVolumeMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkActor2DCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkActor2D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkActorCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkActor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAssembly.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkBackgroundColorMonitor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkBillboardTextActor3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCameraActor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCamera.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCameraInterpolator.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCellCenterDepthSort.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkColorTransferFunction.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCompositeDataDisplayAttributes.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCompositePolyDataMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCoordinate.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCullerCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCuller.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkDataSetMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkDiscretizableColorTransferFunction.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkDistanceToCamera.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkFollower.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkFrameBufferObjectBase.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkFrustumCoverageCuller.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkFXAAOptions.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGenericRenderWindowInteractor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGenericVertexAttributeMapping.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGlyph3DMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGPUInfo.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGPUInfoList.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGraphicsFactory.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGraphMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkGraphToGlyphs.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkHardwareSelector.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkHierarchicalPolyDataMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkImageActor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkImageMapper3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkImageMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkImageProperty.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkImageSlice.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkImageSliceMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkInteractorEventRecorder.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkInteractorObserver.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLabeledContourMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLightActor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLightCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLight.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLightKit.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLogLookupTable.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLookupTableWithEnabling.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkMapArrayValues.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkMapper2D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkMapperCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkObserverMediator.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPolyDataMapper2D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPolyDataMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkProp3DCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkProp3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkProp3DFollower.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPropAssembly.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPropCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPropPicker3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkProp.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkProperty2D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkProperty.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRendererCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderer.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRendererDelegate.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRendererSource.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderPass.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderState.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderWindowCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderWindow.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderWindowInteractor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderWindowInteractor3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkSelectVisiblePoints.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkShaderDeviceAdapter2.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTextActor.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTextActor3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTexture.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTexturedActor2D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTransformCoordinateSystems.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTransformInterpolator.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTupleInterpolator.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkViewDependentErrorMetric.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkViewport.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkVisibilitySort.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkVolumeCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkVolume.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkVolumeProperty.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkWindowLevelLookupTable.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkWindowToImageFilter.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAssemblyNode.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAssemblyPath.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAssemblyPaths.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAreaPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAbstractPropPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPropPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPickingManager.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkLODProp3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkWorldPointPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkCellPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPointPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderedAreaPicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkScenePicker.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkInteractorStyle.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkInteractorStyleSwitchBase.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkInteractorStyle3D.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTDxInteractorStyle.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTDxInteractorStyleCamera.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTDxInteractorStyleSettings.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkStringToImage.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTextMapper.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTextProperty.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTextPropertyCollection.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkTextRenderer.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAbstractInteractionDevice.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkAbstractRenderDevice.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkRenderWidget.h"
    "/home/ezequiel/VTK/Rendering/Core/vtkPointGaussianMapper.h"
    "/home/ezequiel/VTK/build/Rendering/Core/vtkRenderingCoreModule.h"
    )
endif()

