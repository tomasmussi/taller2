# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/XML/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/XML/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOXMLCxx-TestAMRXMLIO "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestAMRXMLIO" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOXMLCxx-TestAMRXMLIO PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestHyperOctreeIO "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestHyperOctreeIO" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/XML/Testing/Data/Baseline/TestHyperOctreeIO.png")
set_tests_properties(vtkIOXMLCxx-TestHyperOctreeIO PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLGhostCellsImport "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLGhostCellsImport" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/XML/Testing/Data/Baseline/TestXMLGhostCellsImport.png")
set_tests_properties(vtkIOXMLCxx-TestXMLGhostCellsImport PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLHierarchicalBoxDataFileConverter "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLHierarchicalBoxDataFileConverter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOXMLCxx-TestXMLHierarchicalBoxDataFileConverter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLUnstructuredGridReader "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLUnstructuredGridReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/XML/Testing/Data/Baseline/TestXMLUnstructuredGridReader.png")
set_tests_properties(vtkIOXMLCxx-TestXMLUnstructuredGridReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXML "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXML" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/sample.xml")
set_tests_properties(vtkIOXMLCxx-TestXML PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLToString "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLToString")
set_tests_properties(vtkIOXMLCxx-TestXMLToString PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLWriterWithDataArrayFallback "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLWriterWithDataArrayFallback" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOXMLCxx-TestXMLWriterWithDataArrayFallback PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestDataObjectXMLIO "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestDataObjectXMLIO" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOXMLCxx-TestDataObjectXMLIO PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestReadDuplicateDataArrayNames "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestReadDuplicateDataArrayNames" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOXMLCxx-TestReadDuplicateDataArrayNames PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLReaderBadImageData "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLReaderBadData" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/badImageData.xml" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOXMLCxx-TestXMLReaderBadImageData PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLReaderBadPolyData "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLReaderBadData" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/badPolyData.xml" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOXMLCxx-TestXMLReaderBadPolyData PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLReaderBadRectilinearGridData "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLReaderBadData" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/badRectilinearGridData.xml" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOXMLCxx-TestXMLReaderBadRectilinearGridData PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLReaderBadUnstucturedGridData "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLReaderBadData" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/badUnstructuredGridData.xml" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOXMLCxx-TestXMLReaderBadUnstucturedGridData PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(vtkIOXMLCxx-TestXMLReaderBadUniformGridData "/home/ezequiel/VTK/build/bin/vtkIOXMLCxxTests" "TestXMLReaderBadData" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/badUniformGridData.xml" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOXMLCxx-TestXMLReaderBadUniformGridData PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOXML")
add_test(TestXMLCInterface "/home/ezequiel/VTK/build/bin/TestXMLCInterface")
