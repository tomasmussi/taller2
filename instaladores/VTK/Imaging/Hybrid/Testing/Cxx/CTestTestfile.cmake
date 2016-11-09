# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Imaging/Hybrid/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Imaging/Hybrid/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkImagingHybridCxx-TestImageToPoints "/home/ezequiel/VTK/build/bin/vtkImagingHybridCxxTests" "TestImageToPoints" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Hybrid/Testing/Data/Baseline/TestImageToPoints.png")
set_tests_properties(vtkImagingHybridCxx-TestImageToPoints PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingHybrid")
add_test(vtkImagingHybridCxx-TestSampleFunction "/home/ezequiel/VTK/build/bin/vtkImagingHybridCxxTests" "TestSampleFunction")
set_tests_properties(vtkImagingHybridCxx-TestSampleFunction PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingHybrid")
