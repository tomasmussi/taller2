# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/FlowPaths/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/FlowPaths/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersFlowPathsCxx-TestBSPTree "/home/ezequiel/VTK/build/bin/vtkFiltersFlowPathsCxxTests" "TestBSPTree" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Filters/FlowPaths/Testing/Data/Baseline/TestBSPTree.png")
set_tests_properties(vtkFiltersFlowPathsCxx-TestBSPTree PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersFlowPaths")
add_test(vtkFiltersFlowPathsCxx-TestStreamTracer "/home/ezequiel/VTK/build/bin/vtkFiltersFlowPathsCxxTests" "TestStreamTracer" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersFlowPathsCxx-TestStreamTracer PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersFlowPaths")
add_test(vtkFiltersFlowPathsCxx-TestStreamTracerSurface "/home/ezequiel/VTK/build/bin/vtkFiltersFlowPathsCxxTests" "TestStreamTracerSurface" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Filters/FlowPaths/Testing/Data/Baseline/TestStreamTracerSurface.png")
set_tests_properties(vtkFiltersFlowPathsCxx-TestStreamTracerSurface PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersFlowPaths")
add_test(vtkFiltersFlowPathsCxx-TestAMRInterpolatedVelocityField "/home/ezequiel/VTK/build/bin/vtkFiltersFlowPathsCxxTests" "TestAMRInterpolatedVelocityField" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersFlowPathsCxx-TestAMRInterpolatedVelocityField PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersFlowPaths")
add_test(vtkFiltersFlowPathsCxx-TestParticleTracers "/home/ezequiel/VTK/build/bin/vtkFiltersFlowPathsCxxTests" "TestParticleTracers" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersFlowPathsCxx-TestParticleTracers PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersFlowPaths")
