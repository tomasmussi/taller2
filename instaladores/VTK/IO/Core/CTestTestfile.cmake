# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Core
# Build directory: /home/ezequiel/VTK/build/IO/Core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOCore-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Core" "VTKIOCORE_EXPORT")
set_tests_properties(vtkIOCore-HeaderTest PROPERTIES  LABELS "vtkIOCore")
