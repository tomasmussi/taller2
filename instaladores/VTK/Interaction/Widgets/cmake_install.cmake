# Install script for directory: /home/ezequiel/VTK/Interaction/Widgets

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
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInteractionWidgets-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInteractionWidgets-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkInteractionWidgets-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkInteractionWidgets-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInteractionWidgets-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkInteractionWidgets-7.1.so"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Interaction/Widgets/CMakeFiles/vtkInteractionWidgets.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Interaction/Widgets/vtk3DWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAbstractPolygonalHandleRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAbstractWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAffineRepresentation2D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAffineRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAffineWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAngleRepresentation2D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAngleRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAngleRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAngleWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAxesTransformRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkAxesTransformWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBalloonRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBalloonWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBezierContourLineInterpolator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBiDimensionalRepresentation2D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBiDimensionalRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBiDimensionalWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBorderRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBorderWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBoundedPlanePointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBoxRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBoxWidget2.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBoxWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkBrokenLineWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkButtonRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkButtonWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCameraRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCameraWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCaptionRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCaptionWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCellCentersPointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCenteredSliderRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCenteredSliderWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCheckerboardRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCheckerboardWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkClosedSurfacePointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkConstrainedPointHandleRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkContinuousValueWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkContinuousValueWidgetRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkContourLineInterpolator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkContourRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkContourWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkCurveRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkDijkstraImageContourLineInterpolator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkDistanceRepresentation2D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkDistanceRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkDistanceRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkDistanceWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkEllipsoidTensorProbeRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkEvent.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkFinitePlaneRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkFinitePlaneWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkFixedSizeHandleRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkFocalPlaneContourRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkFocalPlanePointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkHandleRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkHandleWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkHoverWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImageActorPointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImageCroppingRegionsWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImageOrthoPlanes.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImagePlaneWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImageTracerWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImplicitCylinderRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImplicitCylinderWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImplicitPlaneRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImplicitPlaneWidget2.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkImplicitPlaneWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkLinearContourLineInterpolator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkLineRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkLineWidget2.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkLineWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkLogoRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkLogoWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkOrientationMarkerWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkOrientedGlyphContourRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkOrientedGlyphFocalPlaneContourRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkOrientedPolygonalHandleRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkParallelopipedRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkParallelopipedWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPlaneWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPlaybackRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPlaybackWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPointHandleRepresentation2D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPointHandleRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPointWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolyDataContourLineInterpolator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolyDataPointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolyDataSourceWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolyLineRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolyLineWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolygonalHandleRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolygonalSurfaceContourLineInterpolator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkPolygonalSurfacePointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkProgressBarRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkProgressBarWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkProp3DButtonRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkRectilinearWipeRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkRectilinearWipeWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkScalarBarRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkScalarBarWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSeedRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSeedWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSliderRepresentation2D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSliderRepresentation3D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSliderRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSliderWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSphereHandleRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSphereRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSphereWidget2.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSphereWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSplineRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSplineWidget2.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkSplineWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTensorProbeRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTensorProbeWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTerrainContourLineInterpolator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTerrainDataPointPlacer.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTextRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTexturedButtonRepresentation2D.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTexturedButtonRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkTextWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkWidgetCallbackMapper.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkWidgetEvent.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkWidgetEventTranslator.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkWidgetRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkWidgetSet.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkXYPlotWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursorLineRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursorRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursorThickLineRepresentation.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursorWidget.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursorActor.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursorPicker.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursor.h"
    "/home/ezequiel/VTK/Interaction/Widgets/vtkResliceCursorPolyDataAlgorithm.h"
    "/home/ezequiel/VTK/build/Interaction/Widgets/vtkInteractionWidgetsModule.h"
    )
endif()

