# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Common/Transforms/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Common/Transforms/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkCommonTransformsCxx-TestTransform "/home/ezequiel/VTK/build/bin/vtkCommonTransformsCxxTests" "TestTransform")
set_tests_properties(vtkCommonTransformsCxx-TestTransform PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonTransforms")
add_test(vtkCommonTransformsCxx-TestLandmarkTransform "/home/ezequiel/VTK/build/bin/vtkCommonTransformsCxxTests" "TestLandmarkTransform")
set_tests_properties(vtkCommonTransformsCxx-TestLandmarkTransform PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonTransforms")
