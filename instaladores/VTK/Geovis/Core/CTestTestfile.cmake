# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Geovis/Core
# Build directory: /home/ezequiel/VTK/build/Geovis/Core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkGeovisCore-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Geovis/Core" "VTKGEOVISCORE_EXPORT")
set_tests_properties(vtkGeovisCore-HeaderTest PROPERTIES  LABELS "vtkGeovisCore")
