# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/SQL
# Build directory: /home/ezequiel/VTK/build/IO/SQL
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOSQL-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/SQL" "VTKIOSQL_EXPORT")
set_tests_properties(vtkIOSQL-HeaderTest PROPERTIES  LABELS "vtkIOSQL")
