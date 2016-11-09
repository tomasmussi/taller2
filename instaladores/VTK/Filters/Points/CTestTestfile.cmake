# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/Points
# Build directory: /home/ezequiel/VTK/build/Filters/Points
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersPoints-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Filters/Points" "VTKFILTERSPOINTS_EXPORT")
set_tests_properties(vtkFiltersPoints-HeaderTest PROPERTIES  LABELS "vtkFiltersPoints")
