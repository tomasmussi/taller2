# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/AMR
# Build directory: /home/ezequiel/VTK/build/Filters/AMR
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersAMR-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Filters/AMR" "VTKFILTERSAMR_EXPORT")
set_tests_properties(vtkFiltersAMR-HeaderTest PROPERTIES  LABELS "vtkFiltersAMR")
