# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Imaging/Core/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Imaging/Core/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkImagingCoreCxx-FastSplatter "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "FastSplatter" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/FastSplatter.png")
set_tests_properties(vtkImagingCoreCxx-FastSplatter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageAccumulate "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageAccumulate" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkImagingCoreCxx-ImageAccumulate PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageAccumulateLarge "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageAccumulateLarge" "32")
set_tests_properties(vtkImagingCoreCxx-ImageAccumulateLarge PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageAutoRange "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageAutoRange" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/ImageAutoRange.png")
set_tests_properties(vtkImagingCoreCxx-ImageAutoRange PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageBSplineCoefficients "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageBSplineCoefficients" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/ImageBSplineCoefficients.png")
set_tests_properties(vtkImagingCoreCxx-ImageBSplineCoefficients PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageHistogram "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageHistogram" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/ImageHistogram.png")
set_tests_properties(vtkImagingCoreCxx-ImageHistogram PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageHistogramStatistics "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageHistogramStatistics" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkImagingCoreCxx-ImageHistogramStatistics PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageResize "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageResize" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/ImageResize.png")
set_tests_properties(vtkImagingCoreCxx-ImageResize PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageResize3D "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageResize3D" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/ImageResize3D.png")
set_tests_properties(vtkImagingCoreCxx-ImageResize3D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageResizeCropping "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageResizeCropping" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/ImageResizeCropping.png")
set_tests_properties(vtkImagingCoreCxx-ImageResizeCropping PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageReslice "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageReslice" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/ImageReslice.png")
set_tests_properties(vtkImagingCoreCxx-ImageReslice PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImageWeightedSum "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImageWeightedSum" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkImagingCoreCxx-ImageWeightedSum PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-ImportExport "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "ImportExport" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkImagingCoreCxx-ImportExport PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-TestBSplineWarp "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestBSplineWarp" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/TestBSplineWarp.png")
set_tests_properties(vtkImagingCoreCxx-TestBSplineWarp PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-TestImageStencilDataMethods "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestImageStencilDataMethods" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkImagingCoreCxx-TestImageStencilDataMethods PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-TestImageStencilIterator "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestImageStencilIterator" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkImagingCoreCxx-TestImageStencilIterator PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-TestStencilWithLasso "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestStencilWithLasso" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/TestStencilWithLasso.png")
set_tests_properties(vtkImagingCoreCxx-TestStencilWithLasso PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-TestStencilWithPolyDataContour "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestStencilWithPolyDataContour" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/TestStencilWithPolyDataContour.png")
set_tests_properties(vtkImagingCoreCxx-TestStencilWithPolyDataContour PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-TestStencilWithPolyDataSurface "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestStencilWithPolyDataSurface" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/TestStencilWithPolyDataSurface.png")
set_tests_properties(vtkImagingCoreCxx-TestStencilWithPolyDataSurface PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-TestUpdateExtentReset "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestUpdateExtentReset" "32" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkImagingCoreCxx-TestUpdateExtentReset PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingCore")
add_test(vtkImagingCoreCxx-AddStencilData "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestImageStencilData" "1" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/TestAddStencilData.png")
add_test(vtkImagingCoreCxx-SubtractStencilData "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestImageStencilData" "2" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/TestSubtractStencilData.png")
add_test(vtkImagingCoreCxx-ClipStencilData "/home/ezequiel/VTK/build/bin/vtkImagingCoreCxxTests" "TestImageStencilData" "3" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Core/Testing/Data/Baseline/TestClipStencilData.png")
