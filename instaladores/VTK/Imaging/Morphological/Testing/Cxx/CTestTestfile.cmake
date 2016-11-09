# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Imaging/Morphological/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Imaging/Morphological/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkImagingMorphologicalCxx-TestImageThresholdConnectivity "/home/ezequiel/VTK/build/bin/vtkImagingMorphologicalCxxTests" "TestImageThresholdConnectivity" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Morphological/Testing/Data/Baseline/TestImageThresholdConnectivity.png")
set_tests_properties(vtkImagingMorphologicalCxx-TestImageThresholdConnectivity PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingMorphological")
add_test(vtkImagingMorphologicalCxx-TestImageConnectivityFilter "/home/ezequiel/VTK/build/bin/vtkImagingMorphologicalCxxTests" "TestImageConnectivityFilter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Imaging/Morphological/Testing/Data/Baseline/TestImageConnectivityFilter.png")
set_tests_properties(vtkImagingMorphologicalCxx-TestImageConnectivityFilter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkImagingMorphological")
