# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Parallel/Core/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Parallel/Core/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkParallelCoreCxx-TestFieldDataSerialization "/home/ezequiel/VTK/build/bin/vtkParallelCoreCxxTests" "TestFieldDataSerialization")
set_tests_properties(vtkParallelCoreCxx-TestFieldDataSerialization PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkParallelCore")
add_test(vtkParallelCore-TestSocketCommunicator "/usr/bin/python2" "/home/ezequiel/VTK/CMake/vtkTestDriver.py" "--process" "/home/ezequiel/VTK/build/bin/vtkParallelCore-TestSocketCommunicator" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "--server" "--process" "/home/ezequiel/VTK/build/bin/vtkParallelCore-TestSocketCommunicator" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
