# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/AMR/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/AMR/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersAMRCxx-TestAMRGhostLayerStripping "/home/ezequiel/VTK/build/bin/vtkFiltersAMRCxxTests" "TestAMRGhostLayerStripping" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkFiltersAMRCxx-TestAMRGhostLayerStripping PROPERTIES  FAIL_REGULAR_EXPRESSION "Error" LABELS "vtkFiltersAMR")
add_test(vtkFiltersAMRCxx-TestAMRBlanking "/home/ezequiel/VTK/build/bin/vtkFiltersAMRCxxTests" "TestAMRBlanking" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkFiltersAMRCxx-TestAMRBlanking PROPERTIES  FAIL_REGULAR_EXPRESSION "Error" LABELS "vtkFiltersAMR")
add_test(vtkFiltersAMRCxx-TestAMRIterator "/home/ezequiel/VTK/build/bin/vtkFiltersAMRCxxTests" "TestAMRIterator" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkFiltersAMRCxx-TestAMRIterator PROPERTIES  FAIL_REGULAR_EXPRESSION "Error" LABELS "vtkFiltersAMR")
add_test(vtkFiltersAMRCxx-TestImageToAMR "/home/ezequiel/VTK/build/bin/vtkFiltersAMRCxxTests" "TestImageToAMR" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkFiltersAMRCxx-TestImageToAMR PROPERTIES  FAIL_REGULAR_EXPRESSION "Error" LABELS "vtkFiltersAMR")
