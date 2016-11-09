# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Imaging/Math
# Build directory: /home/ezequiel/VTK/build/Imaging/Math
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkImagingMath-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Imaging/Math" "VTKIMAGINGMATH_EXPORT")
set_tests_properties(vtkImagingMath-HeaderTest PROPERTIES  LABELS "vtkImagingMath")
