# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Infovis/Layout/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Infovis/Layout/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkInfovisLayoutCxx-TestChacoGraphReader "/home/ezequiel/VTK/build/bin/vtkInfovisLayoutCxxTests" "TestChacoGraphReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Infovis/Layout/Testing/Data/Baseline/TestChacoGraphReader.png")
set_tests_properties(vtkInfovisLayoutCxx-TestChacoGraphReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkInfovisLayout")
add_test(vtkInfovisLayoutCxx-TestCirclePackLayoutStrategy "/home/ezequiel/VTK/build/bin/vtkInfovisLayoutCxxTests" "TestCirclePackLayoutStrategy" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Infovis/Layout/Testing/Data/Baseline/TestCirclePackLayoutStrategy.png")
set_tests_properties(vtkInfovisLayoutCxx-TestCirclePackLayoutStrategy PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkInfovisLayout")
add_test(vtkInfovisLayoutCxx-TestGraphLayoutStrategy "/home/ezequiel/VTK/build/bin/vtkInfovisLayoutCxxTests" "TestGraphLayoutStrategy" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkInfovisLayoutCxx-TestGraphLayoutStrategy PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkInfovisLayout")
add_test(vtkInfovisLayoutCxx-TestIncrementalForceLayout "/home/ezequiel/VTK/build/bin/vtkInfovisLayoutCxxTests" "TestIncrementalForceLayout" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkInfovisLayoutCxx-TestIncrementalForceLayout PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkInfovisLayout")
add_test(vtkInfovisLayoutCxx-TestTreeMapLayoutStrategy "/home/ezequiel/VTK/build/bin/vtkInfovisLayoutCxxTests" "TestTreeMapLayoutStrategy" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Infovis/Layout/Testing/Data/Baseline/TestTreeMapLayoutStrategy.png")
set_tests_properties(vtkInfovisLayoutCxx-TestTreeMapLayoutStrategy PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkInfovisLayout")
