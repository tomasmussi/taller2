# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Exodus
# Build directory: /home/ezequiel/VTK/build/IO/Exodus
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOExodus-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Exodus" "VTKIOEXODUS_EXPORT")
set_tests_properties(vtkIOExodus-HeaderTest PROPERTIES  LABELS "vtkIOExodus")
