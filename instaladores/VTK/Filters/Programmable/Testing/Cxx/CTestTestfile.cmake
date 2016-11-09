# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/Programmable/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/Programmable/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersProgrammableCxx-TestProgrammableGlyph "/home/ezequiel/VTK/build/bin/vtkFiltersProgrammableCxxTests" "TestProgrammableGlyph" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Filters/Programmable/Testing/Data/Baseline/TestProgrammableGlyph.png")
set_tests_properties(vtkFiltersProgrammableCxx-TestProgrammableGlyph PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersProgrammable")
