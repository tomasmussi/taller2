# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/NetCDF
# Build directory: /home/ezequiel/VTK/build/IO/NetCDF
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIONetCDF-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/IO/NetCDF" "VTKIONETCDF_EXPORT")
set_tests_properties(vtkIONetCDF-HeaderTest PROPERTIES  LABELS "vtkIONetCDF")
