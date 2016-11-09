# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Common/DataModel
# Build directory: /home/ezequiel/VTK/build/Common/DataModel
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkCommonDataModel-HeaderTest "/usr/bin/python2" "/home/ezequiel/VTK/Testing/Core/HeaderTesting.py" "/home/ezequiel/VTK/Common/DataModel" "VTKCOMMONDATAMODEL_EXPORT")
set_tests_properties(vtkCommonDataModel-HeaderTest PROPERTIES  LABELS "vtkCommonDataModel")
