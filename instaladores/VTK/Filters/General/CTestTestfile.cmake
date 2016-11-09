# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/General
# Build directory: /home/ezequiel/VTK/build/Filters/General
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersGeneral-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Filters/General" "VTKFILTERSGENERAL_EXPORT")
set_tests_properties(vtkFiltersGeneral-HeaderTest PROPERTIES  LABELS "vtkFiltersGeneral")
