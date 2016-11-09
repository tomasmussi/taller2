# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Parallel
# Build directory: /home/ezequiel/VTK/build/IO/Parallel
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOParallel-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Parallel" "VTKIOPARALLEL_EXPORT")
set_tests_properties(vtkIOParallel-HeaderTest PROPERTIES  LABELS "vtkIOParallel")
