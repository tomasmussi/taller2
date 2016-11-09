# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/TecplotTable/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/TecplotTable/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOTecplotTableCxx-TestTecplotTableReader "/home/ezequiel/VTK/build/bin/vtkIOTecplotTableCxxTests" "TestTecplotTableReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOTecplotTableCxx-TestTecplotTableReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOTecplotTable")
add_test(TestTecplotTableReader "/home/ezequiel/VTK/build/bin/vtkIOTecplotTableCxxTests" "TestTecplotTableReader" "-D" "/home/ezequiel/VTK/build/ExternalData/IO/TecplotTable/Testing/Data/residuals.dat")
