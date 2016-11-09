# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Imaging/General
# Build directory: /home/ezequiel/VTK/build/Imaging/General
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkImagingGeneral-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Imaging/General" "VTKIMAGINGGENERAL_EXPORT")
set_tests_properties(vtkImagingGeneral-HeaderTest PROPERTIES  LABELS "vtkImagingGeneral")
