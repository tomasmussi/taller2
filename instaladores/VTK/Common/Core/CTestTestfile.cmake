# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Common/Core
# Build directory: /home/ezequiel/VTK/build/Common/Core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkCommonCore-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Common/Core" "VTKCOMMONCORE_EXPORT")
set_tests_properties(vtkCommonCore-HeaderTest PROPERTIES  LABELS "vtkCommonCore")
