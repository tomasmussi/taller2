# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Imaging/Sources
# Build directory: /home/ezequiel/VTK/build/Imaging/Sources
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkImagingSources-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Imaging/Sources" "VTKIMAGINGSOURCES_EXPORT")
set_tests_properties(vtkImagingSources-HeaderTest PROPERTIES  LABELS "vtkImagingSources")
