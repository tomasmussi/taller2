# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Views/Core
# Build directory: /home/ezequiel/VTK/build/Views/Core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkViewsCore-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Views/Core" "VTKVIEWSCORE_EXPORT")
set_tests_properties(vtkViewsCore-HeaderTest PROPERTIES  LABELS "vtkViewsCore")
