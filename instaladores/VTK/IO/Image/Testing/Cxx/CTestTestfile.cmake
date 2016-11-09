# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/Image/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/Image/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOImageCxx-TestNrrdReader "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestNrrdReader" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestNrrdReader.png")
set_tests_properties(vtkIOImageCxx-TestNrrdReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestNIFTIReaderWriter "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestNIFTIReaderWriter" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestNIFTIReaderWriter.png")
set_tests_properties(vtkIOImageCxx-TestNIFTIReaderWriter PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestNIFTIReaderAnalyze "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestNIFTIReaderAnalyze" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestNIFTIReaderAnalyze.png")
set_tests_properties(vtkIOImageCxx-TestNIFTIReaderAnalyze PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestNIFTI2 "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestNIFTI2" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestNIFTI2.png")
set_tests_properties(vtkIOImageCxx-TestNIFTI2 PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestDataObjectIO "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestDataObjectIO")
set_tests_properties(vtkIOImageCxx-TestDataObjectIO PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestMetaIO "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestMetaIO" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/HeadMRVolume.mhd")
set_tests_properties(vtkIOImageCxx-TestMetaIO PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestImportExport "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestImportExport")
set_tests_properties(vtkIOImageCxx-TestImportExport PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestTIFFReaderMultipleMulti "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestTIFFReaderMultiple" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/libtiff/multipage_tiff_example.tif" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOImageCxx-TestTIFFReaderMultipleMulti PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestTIFFReaderMultipleNormal "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestTIFFReaderMultiple" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/libtiff/test.tif" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOImageCxx-TestTIFFReaderMultipleNormal PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestTIFFReaderMultipleTiled "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestTIFFReaderMultiple" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/libtiff/tiled_10x30_tiff_example.tif" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing")
set_tests_properties(vtkIOImageCxx-TestTIFFReaderMultipleTiled PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestTIFFReaderMulti "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestTIFFReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/libtiff/multipage_tiff_example.tif" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestTIFFReaderMulti.png")
set_tests_properties(vtkIOImageCxx-TestTIFFReaderMulti PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestTIFFReaderTiled "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestTIFFReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/libtiff/tiled_64x64_tiff_example.tif" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestTIFFReaderTiled.png")
set_tests_properties(vtkIOImageCxx-TestTIFFReaderTiled PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestTIFFReaderTiledRGB "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestTIFFReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/libtiff/gourds_tiled_200x300.tif" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestTIFFReaderTiledRGB.png")
set_tests_properties(vtkIOImageCxx-TestTIFFReaderTiledRGB PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
add_test(vtkIOImageCxx-TestCompressedTIFFReader "/home/ezequiel/VTK/build/bin/vtkIOImageCxxTests" "TestCompressedTIFFReader" "/home/ezequiel/VTK/build/ExternalData/Testing/Data/al_foam_smallest.0.tif" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-V" "/home/ezequiel/VTK/build/ExternalData/IO/Image/Testing/Data/Baseline/TestCompressedTIFFReader.png")
set_tests_properties(vtkIOImageCxx-TestCompressedTIFFReader PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOImage")
