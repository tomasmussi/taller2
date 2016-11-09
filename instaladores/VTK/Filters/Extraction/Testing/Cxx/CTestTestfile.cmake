# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Filters/Extraction/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Filters/Extraction/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkFiltersExtractionCxx-TestConvertSelection "/home/ezequiel/VTK/build/bin/vtkFiltersExtractionCxxTests" "TestConvertSelection" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersExtractionCxx-TestConvertSelection PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersExtraction")
add_test(vtkFiltersExtractionCxx-TestExtractSelection "/home/ezequiel/VTK/build/bin/vtkFiltersExtractionCxxTests" "TestExtractSelection" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Filters/Extraction/Testing/Data/Baseline/TestExtractSelection.png")
set_tests_properties(vtkFiltersExtractionCxx-TestExtractSelection PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersExtraction")
add_test(vtkFiltersExtractionCxx-TestExtraction "/home/ezequiel/VTK/build/bin/vtkFiltersExtractionCxxTests" "TestExtraction" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-V" "/home/ezequiel/VTK/build/ExternalData/Filters/Extraction/Testing/Data/Baseline/TestExtraction.png")
set_tests_properties(vtkFiltersExtractionCxx-TestExtraction PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersExtraction")
add_test(vtkFiltersExtractionCxx-TestExtractRectilinearGrid "/home/ezequiel/VTK/build/bin/vtkFiltersExtractionCxxTests" "TestExtractRectilinearGrid" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersExtractionCxx-TestExtractRectilinearGrid PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersExtraction")
add_test(vtkFiltersExtractionCxx-TestExtractTimeSteps "/home/ezequiel/VTK/build/bin/vtkFiltersExtractionCxxTests" "TestExtractTimeSteps" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkFiltersExtractionCxx-TestExtractTimeSteps PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkFiltersExtraction")
