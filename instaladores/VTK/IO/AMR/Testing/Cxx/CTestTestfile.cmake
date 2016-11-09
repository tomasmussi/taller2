# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/AMR/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/AMR/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOAMRCxx-TestEnzoReader "/home/ezequiel/VTK/build/bin/vtkIOAMRCxxTests" "TestEnzoReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOAMRCxx-TestEnzoReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOAMR")
