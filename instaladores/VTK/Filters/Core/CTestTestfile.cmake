# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/Core
# Build directory: /home/ezequiel/VTK/build/Filters/Core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersCore-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Filters/Core" "VTKFILTERSCORE_EXPORT")
set_tests_properties(vtkFiltersCore-HeaderTest PROPERTIES  LABELS "vtkFiltersCore")
