# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Geometry
# Build directory: /home/ezequiel/VTK/build/IO/Geometry
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOGeometry-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/Geometry" "VTKIOGEOMETRY_EXPORT")
set_tests_properties(vtkIOGeometry-HeaderTest PROPERTIES  LABELS "vtkIOGeometry")
