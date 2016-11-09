# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Common/Color/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Common/Color/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkCommonColorCxx-TestCategoricalColors "/home/ezequiel/VTK/build/bin/vtkCommonColorCxxTests" "TestCategoricalColors" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkCommonColorCxx-TestCategoricalColors PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonColor")
add_test(vtkCommonColorCxx-TestColorSeries "/home/ezequiel/VTK/build/bin/vtkCommonColorCxxTests" "TestColorSeries" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Common/Color/Testing/Data/Baseline/TestColorSeries.png")
set_tests_properties(vtkCommonColorCxx-TestColorSeries PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonColor")
add_test(vtkCommonColorCxx-TestColorSeriesLookupTables "/home/ezequiel/VTK/build/bin/vtkCommonColorCxxTests" "TestColorSeriesLookupTables" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkCommonColorCxx-TestColorSeriesLookupTables PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonColor")
add_test(vtkCommonColorCxx-TestNamedColors "/home/ezequiel/VTK/build/bin/vtkCommonColorCxxTests" "TestNamedColors" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkCommonColorCxx-TestNamedColors PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonColor")
