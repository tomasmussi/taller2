# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Legacy
# Build directory: /home/ezequiel/VTK/build/IO/Legacy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOLegacy-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Legacy" "VTKIOLEGACY_EXPORT")
set_tests_properties(vtkIOLegacy-HeaderTest PROPERTIES  LABELS "vtkIOLegacy")
