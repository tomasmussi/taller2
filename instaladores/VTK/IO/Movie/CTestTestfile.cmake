# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Movie
# Build directory: /home/ezequiel/VTK/build/IO/Movie
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOMovie-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Movie" "VTKIOMOVIE_EXPORT")
set_tests_properties(vtkIOMovie-HeaderTest PROPERTIES  LABELS "vtkIOMovie")
