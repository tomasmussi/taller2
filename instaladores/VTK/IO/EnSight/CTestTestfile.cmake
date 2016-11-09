# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/EnSight
# Build directory: /home/ezequiel/VTK/build/IO/EnSight
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOEnSight-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/EnSight" "VTKIOENSIGHT_EXPORT")
set_tests_properties(vtkIOEnSight-HeaderTest PROPERTIES  LABELS "vtkIOEnSight")
