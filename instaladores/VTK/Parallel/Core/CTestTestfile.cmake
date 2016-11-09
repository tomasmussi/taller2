# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Parallel/Core
# Build directory: /home/ezequiel/VTK/build/Parallel/Core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkParallelCore-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Parallel/Core" "VTKPARALLELCORE_EXPORT")
set_tests_properties(vtkParallelCore-HeaderTest PROPERTIES  LABELS "vtkParallelCore")
