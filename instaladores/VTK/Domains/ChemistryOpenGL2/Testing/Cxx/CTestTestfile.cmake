# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Domains/ChemistryOpenGL2/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Domains/ChemistryOpenGL2/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkDomainsChemistryOpenGL2Cxx-TestPDBBallAndStickShadows "/home/ezequiel/VTK/build/bin/vtkDomainsChemistryOpenGL2CxxTests" "TestPDBBallAndStickShadows" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Domains/ChemistryOpenGL2/Testing/Data/Baseline/TestPDBBallAndStickShadows.png")
set_tests_properties(vtkDomainsChemistryOpenGL2Cxx-TestPDBBallAndStickShadows PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkDomainsChemistryOpenGL2" RUN_SERIAL "ON" TIMEOUT "360")
add_test(vtkDomainsChemistryOpenGL2Cxx-TestPDBBallAndStickShadowsDOFSSAA "/home/ezequiel/VTK/build/bin/vtkDomainsChemistryOpenGL2CxxTests" "TestPDBBallAndStickShadowsDOFSSAA" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Domains/ChemistryOpenGL2/Testing/Data/Baseline/TestPDBBallAndStickShadowsDOFSSAA.png")
set_tests_properties(vtkDomainsChemistryOpenGL2Cxx-TestPDBBallAndStickShadowsDOFSSAA PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkDomainsChemistryOpenGL2")
