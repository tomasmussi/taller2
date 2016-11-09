# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Import/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/Import/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOImportCxx-TestOBJImporter "/home/ezequiel/VTK/build/bin/vtkIOImportCxxTests" "TestOBJImporter" "-D" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/boxes_1.obj" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/boxes_1.obj.mtl" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/flare.jpg" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/map1024.png" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOImportCxx-TestOBJImporter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImport")
add_test(vtkIOImportCxx-TestVRMLNormals "/home/ezequiel/VTK/build/bin/vtkIOImportCxxTests" "TestVRMLNormals" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Baseline/TestVRMLNormals.png")
set_tests_properties(vtkIOImportCxx-TestVRMLNormals PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImport")
add_test(vtkIOImportCxx-TestVRMLImporter "/home/ezequiel/VTK/build/bin/vtkIOImportCxxTests" "TestVRMLImporter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOImportCxx-TestVRMLImporter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImport")
add_test(vtkIOImportCxx-OBJImport-MixedOrder1 "/home/ezequiel/VTK/build/bin/vtkIOImportCxxTests" "TestOBJImporter" "-D" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/boxes_2.obj" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/boxes_2.obj.mtl" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/flare.jpg" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/map1024.png" "-D" " /home/ezequiel/VTK/build/Testing/Temporary ")
add_test(vtkIOImportCxx-OBJImport-NoMTL "/home/ezequiel/VTK/build/bin/vtkIOImportCxxTests" "TestOBJImporter" "-D" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/boxes_3_no_mtl.obj" "-D" " /home/ezequiel/VTK/build/Testing/Temporary ")
add_test(vtkIOImportCxx-OBJImport-SolidAndTextured "/home/ezequiel/VTK/build/bin/vtkIOImportCxxTests" "TestOBJImporter" "-D" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/cube-scene.obj" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/cube-scene.mtl" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/noise.png" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/noise.png" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Baseline/OBJImport-SolidAndTextured.png" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
add_test(vtkIOImportCxx-OBJImport-MTLwithoutTextureFile "/home/ezequiel/VTK/build/bin/vtkIOImportCxxTests" "TestOBJImporter" "-D" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/boxes_4_mtl_no_texture.obj" "/home/ezequiel/VTK/build/ExternalData/IO/Import/Testing/Data/Input/boxes_4_mtl_no_texture.obj.mtl" "-D" " /home/ezequiel/VTK/build/Testing/Temporary ")
