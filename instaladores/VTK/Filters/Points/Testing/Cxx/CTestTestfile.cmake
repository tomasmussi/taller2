# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/Points/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/Points/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersPointsCxx-UnitTestKernels "/home/ezequiel/VTK/build/bin/vtkFiltersPointsCxxTests" "UnitTestKernels" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersPointsCxx-UnitTestKernels PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersPoints")
add_test(vtkFiltersPointsCxx-TestSPHKernels "/home/ezequiel/VTK/build/bin/vtkFiltersPointsCxxTests" "TestSPHKernels" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersPointsCxx-TestSPHKernels PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersPoints")
add_test(vtkFiltersPointsCxx-PlotSPHKernels "/home/ezequiel/VTK/build/bin/vtkFiltersPointsCxxTests" "PlotSPHKernels" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Filters/Points/Testing/Data/Baseline/PlotSPHKernels.png")
set_tests_properties(vtkFiltersPointsCxx-PlotSPHKernels PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersPoints")
