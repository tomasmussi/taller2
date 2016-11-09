# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/SMP
# Build directory: /home/ezequiel/VTK/build/Filters/SMP
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersSMP-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Filters/SMP" "VTKFILTERSSMP_EXPORT")
set_tests_properties(vtkFiltersSMP-HeaderTest PROPERTIES  LABELS "vtkFiltersSMP")
