# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/Selection/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/Selection/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersSelectionCxx-TestLinearSelector2D "/home/ezequiel/VTK/build/bin/vtkFiltersSelectionCxxTests" "TestLinearSelector2D" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSelectionCxx-TestLinearSelector2D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSelection")
add_test(vtkFiltersSelectionCxx-TestCellDistanceSelector2D "/home/ezequiel/VTK/build/bin/vtkFiltersSelectionCxxTests" "TestCellDistanceSelector2D" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSelectionCxx-TestCellDistanceSelector2D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSelection")
add_test(vtkFiltersSelectionCxx-TestCellDistanceSelector3D "/home/ezequiel/VTK/build/bin/vtkFiltersSelectionCxxTests" "TestCellDistanceSelector3D" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSelectionCxx-TestCellDistanceSelector3D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSelection")
add_test(vtkFiltersSelectionCxx-TestLinearSelector3D "/home/ezequiel/VTK/build/bin/vtkFiltersSelectionCxxTests" "TestLinearSelector3D" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSelectionCxx-TestLinearSelector3D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSelection")
