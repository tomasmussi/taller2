# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Common/System/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Common/System/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkCommonSystemCxx-TestDirectory "/home/ezequiel/VTK/build/bin/vtkCommonSystemCxxTests" "TestDirectory")
set_tests_properties(vtkCommonSystemCxx-TestDirectory PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonSystem")
add_test(vtkCommonSystemCxx-otherTimerLog "/home/ezequiel/VTK/build/bin/vtkCommonSystemCxxTests" "otherTimerLog")
set_tests_properties(vtkCommonSystemCxx-otherTimerLog PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkCommonSystem")
