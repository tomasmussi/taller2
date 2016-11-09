# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/SMP/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/SMP/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersSMPCxx-TestSMPContour "/home/ezequiel/VTK/build/bin/vtkFiltersSMPCxxTests" "TestSMPContour" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSMPCxx-TestSMPContour PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSMP")
add_test(vtkFiltersSMPCxx-TestThreadedSynchronizedTemplates3D "/home/ezequiel/VTK/build/bin/vtkFiltersSMPCxxTests" "TestThreadedSynchronizedTemplates3D" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSMPCxx-TestThreadedSynchronizedTemplates3D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSMP")
add_test(vtkFiltersSMPCxx-TestThreadedSynchronizedTemplatesCutter3D "/home/ezequiel/VTK/build/bin/vtkFiltersSMPCxxTests" "TestThreadedSynchronizedTemplatesCutter3D" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSMPCxx-TestThreadedSynchronizedTemplatesCutter3D PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSMP")
add_test(vtkFiltersSMPCxx-TestSMPTransform "/home/ezequiel/VTK/build/bin/vtkFiltersSMPCxxTests" "TestSMPTransform" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSMPCxx-TestSMPTransform PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSMP")
add_test(vtkFiltersSMPCxx-TestSMPWarp "/home/ezequiel/VTK/build/bin/vtkFiltersSMPCxxTests" "TestSMPWarp" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersSMPCxx-TestSMPWarp PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersSMP")
