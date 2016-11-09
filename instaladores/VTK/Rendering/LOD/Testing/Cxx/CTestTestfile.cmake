# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Rendering/LOD/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Rendering/LOD/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkRenderingLODCxx-TestLODActor "/home/ezequiel/VTK/build/bin/vtkRenderingLODCxxTests" "TestLODActor" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkRenderingLODCxx-TestLODActor PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkRenderingLOD")
