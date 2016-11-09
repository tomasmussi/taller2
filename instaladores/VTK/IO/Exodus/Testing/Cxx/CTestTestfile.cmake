# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Exodus/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/Exodus/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOExodusCxx-TestExodusAttributes "/home/ezequiel/VTK/build/bin/vtkIOExodusCxxTests" "TestExodusAttributes" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOExodusCxx-TestExodusAttributes PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOExodus")
add_test(vtkIOExodusCxx-TestExodusSideSets "/home/ezequiel/VTK/build/bin/vtkIOExodusCxxTests" "TestExodusSideSets" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOExodusCxx-TestExodusSideSets PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOExodus")
add_test(vtkIOExodusCxx-TestMultiBlockExodusWrite "/home/ezequiel/VTK/build/bin/vtkIOExodusCxxTests" "TestMultiBlockExodusWrite" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Exodus/Testing/Data/Baseline/TestMultiBlockExodusWrite.png")
set_tests_properties(vtkIOExodusCxx-TestMultiBlockExodusWrite PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOExodus")
