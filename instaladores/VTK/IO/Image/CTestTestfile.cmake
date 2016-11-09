# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Image
# Build directory: /home/ezequiel/VTK/build/IO/Image
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOImage-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Image" "VTKIOIMAGE_EXPORT")
set_tests_properties(vtkIOImage-HeaderTest PROPERTIES  LABELS "vtkIOImage")
