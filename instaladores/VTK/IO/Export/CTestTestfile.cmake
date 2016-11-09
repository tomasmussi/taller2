# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Export
# Build directory: /home/ezequiel/VTK/build/IO/Export
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOExport-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Export" "VTKIOEXPORT_EXPORT")
set_tests_properties(vtkIOExport-HeaderTest PROPERTIES  LABELS "vtkIOExport")
