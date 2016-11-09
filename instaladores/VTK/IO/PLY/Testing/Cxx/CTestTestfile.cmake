# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/PLY/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/PLY/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOPLYCxx-TestPLYReader "/home/ezequiel/VTK/build/bin/vtkIOPLYCxxTests" "TestPLYReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/PLY/Testing/Data/Baseline/TestPLYReader.png")
set_tests_properties(vtkIOPLYCxx-TestPLYReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOPLY")
add_test(vtkIOPLYCxx-TestPLYReaderTextureUV "/home/ezequiel/VTK/build/bin/vtkIOPLYCxxTests" "TestPLYReaderTextureUV" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/PLY/Testing/Data/Baseline/TestPLYReaderTextureUV.png")
set_tests_properties(vtkIOPLYCxx-TestPLYReaderTextureUV PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOPLY")
add_test(vtkIOPLYCxx-TestPLYWriter "/home/ezequiel/VTK/build/bin/vtkIOPLYCxxTests" "TestPLYWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOPLYCxx-TestPLYWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOPLY")
