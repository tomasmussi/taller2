# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Movie/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/Movie/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOMovieCxx-TestOggTheoraWriter "/home/ezequiel/VTK/build/bin/vtkIOMovieCxxTests" "TestOggTheoraWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOMovieCxx-TestOggTheoraWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOMovie")
