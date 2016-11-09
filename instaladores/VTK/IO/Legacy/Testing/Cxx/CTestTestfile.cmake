# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Legacy/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/Legacy/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOLegacyCxx-TestLegacyCompositeDataReaderWriter "/home/ezequiel/VTK/build/bin/vtkIOLegacyCxxTests" "TestLegacyCompositeDataReaderWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOLegacyCxx-TestLegacyCompositeDataReaderWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOLegacy")
add_test(vtkIOLegacyCxx-TestLegacyGhostCellsImport "/home/ezequiel/VTK/build/bin/vtkIOLegacyCxxTests" "TestLegacyGhostCellsImport" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Legacy/Testing/Data/Baseline/TestLegacyGhostCellsImport.png")
set_tests_properties(vtkIOLegacyCxx-TestLegacyGhostCellsImport PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOLegacy")
add_test(vtkIOLegacyCxx-TestLegacyArrayMetaData "/home/ezequiel/VTK/build/bin/vtkIOLegacyCxxTests" "TestLegacyArrayMetaData" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOLegacyCxx-TestLegacyArrayMetaData PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOLegacy")
