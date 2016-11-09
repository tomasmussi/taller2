# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/XML
# Build directory: /home/ezequiel/VTK/build/IO/XML
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOXML-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/XML" "VTKIOXML_EXPORT")
set_tests_properties(vtkIOXML-HeaderTest PROPERTIES  LABELS "vtkIOXML")
