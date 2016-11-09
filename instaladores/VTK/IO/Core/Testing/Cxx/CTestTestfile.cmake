# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Core/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/Core/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOCoreCxx-TestArrayDataWriter "/home/ezequiel/VTK/build/bin/vtkIOCoreCxxTests" "TestArrayDataWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOCoreCxx-TestArrayDataWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOCore")
add_test(vtkIOCoreCxx-TestArrayDenormalized "/home/ezequiel/VTK/build/bin/vtkIOCoreCxxTests" "TestArrayDenormalized" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOCoreCxx-TestArrayDenormalized PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOCore")
add_test(vtkIOCoreCxx-TestArraySerialization "/home/ezequiel/VTK/build/bin/vtkIOCoreCxxTests" "TestArraySerialization" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOCoreCxx-TestArraySerialization PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOCore")
add_test(vtkIOCoreCxx-TestCompress "/home/ezequiel/VTK/build/bin/vtkIOCoreCxxTests" "TestCompress" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOCoreCxx-TestCompress PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOCore")
