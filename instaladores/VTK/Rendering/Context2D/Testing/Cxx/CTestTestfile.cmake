# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Rendering/Context2D/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Rendering/Context2D/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkRenderingContext2DCxx-TestContext2D "/home/ezequiel/VTK/build/bin/vtkRenderingContext2DCxxTests" "TestContext2D" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkRenderingContext2DCxx-TestContext2D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkRenderingContext2D")
