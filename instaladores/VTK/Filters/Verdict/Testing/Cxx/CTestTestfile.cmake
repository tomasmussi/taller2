# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/Verdict/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/Verdict/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersVerdictCxx-MeshQuality "/home/ezequiel/VTK/build/bin/vtkFiltersVerdictCxxTests" "MeshQuality" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersVerdictCxx-MeshQuality PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersVerdict")
