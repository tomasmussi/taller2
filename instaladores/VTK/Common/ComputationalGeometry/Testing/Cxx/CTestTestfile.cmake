# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Common/ComputationalGeometry/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Common/ComputationalGeometry/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkCommonComputationalGeometryCxx-UnitTestParametricSpline "/home/ezequiel/VTK/build/bin/vtkCommonComputationalGeometryCxxTests" "UnitTestParametricSpline")
set_tests_properties(vtkCommonComputationalGeometryCxx-UnitTestParametricSpline PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonComputationalGeometry")
