# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Geometry/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/Geometry/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOGeometryCxx-TestDataObjectIO "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestDataObjectIO" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-TestDataObjectIO PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestIncrementalOctreePointLocator "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestIncrementalOctreePointLocator" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-TestIncrementalOctreePointLocator PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-UnstructuredGridCellGradients "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "UnstructuredGridCellGradients" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/UnstructuredGridCellGradients.png")
set_tests_properties(vtkIOGeometryCxx-UnstructuredGridCellGradients PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-UnstructuredGridFastGradients "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "UnstructuredGridFastGradients" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/UnstructuredGridFastGradients.png")
set_tests_properties(vtkIOGeometryCxx-UnstructuredGridFastGradients PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-UnstructuredGridGradients "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "UnstructuredGridGradients" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/UnstructuredGridGradients.png")
set_tests_properties(vtkIOGeometryCxx-UnstructuredGridGradients PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestOBJReaderRelative "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestOBJReaderRelative" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-TestOBJReaderRelative PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestOBJReaderNormalsTCoords "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestOBJReaderNormalsTCoords" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-TestOBJReaderNormalsTCoords PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestOpenFOAMReader "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestOpenFOAMReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestOpenFOAMReader.png")
set_tests_properties(vtkIOGeometryCxx-TestOpenFOAMReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestProStarReader "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestProStarReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestProStarReader.png")
set_tests_properties(vtkIOGeometryCxx-TestProStarReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestTecplotReader "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestTecplotReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestTecplotReader.png")
set_tests_properties(vtkIOGeometryCxx-TestTecplotReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestAMRReadWrite "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestAMRReadWrite" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-TestAMRReadWrite PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestSimplePointsReaderWriter "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestSimplePointsReaderWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-TestSimplePointsReaderWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestHoudiniPolyDataWriter "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestHoudiniPolyDataWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-TestHoudiniPolyDataWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-UnitTestSTLWriter "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "UnitTestSTLWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOGeometryCxx-UnitTestSTLWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestSTLReaderSinglePatch "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestSTLReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/42400-IDGH.stl" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestSTLReaderSinglePatch.png")
set_tests_properties(vtkIOGeometryCxx-TestSTLReaderSinglePatch PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestSTLReaderMultiplePatches "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestSTLReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/multiple_patches.stl" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestSTLReaderMultiplePatches.png")
set_tests_properties(vtkIOGeometryCxx-TestSTLReaderMultiplePatches PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestPTSReader "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestPTSReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/samplePTS.pts" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestPTSReader.png")
set_tests_properties(vtkIOGeometryCxx-TestPTSReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestAVSucdReaderContiguousASCII "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestAVSucdReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/cellsnd.ascii.inp" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestAVSucdReaderContiguousASCII.png")
set_tests_properties(vtkIOGeometryCxx-TestAVSucdReaderContiguousASCII PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestAVSucdReaderNonContiguousASCII "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestAVSucdReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/cellsnd.noncontiguous.ascii.inp" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestAVSucdReaderNonContiguousASCII.png")
set_tests_properties(vtkIOGeometryCxx-TestAVSucdReaderNonContiguousASCII PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
add_test(vtkIOGeometryCxx-TestAVSucdReaderBinary "/home/ezequiel/VTK/build/bin/vtkIOGeometryCxxTests" "TestAVSucdReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/cellsnd.bin.inp" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Geometry/Testing/Data/Baseline/TestAVSucdReaderBinary.png")
set_tests_properties(vtkIOGeometryCxx-TestAVSucdReaderBinary PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOGeometry")
