# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/IO/SQL/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/IO/SQL/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkIOSQLCxx-TestSQLDatabaseSchema "/home/ezequiel/VTK/build/bin/vtkIOSQLCxxTests" "TestSQLDatabaseSchema" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOSQLCxx-TestSQLDatabaseSchema PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOSQL" RUN_SERIAL "1")
add_test(vtkIOSQLCxx-TestSQLiteDatabase "/home/ezequiel/VTK/build/bin/vtkIOSQLCxxTests" "TestSQLiteDatabase" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkIOSQLCxx-TestSQLiteDatabase PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOSQL" RUN_SERIAL "1")
add_test(vtkIOSQLCxx-TestSQLiteTableReadWrite "/home/ezequiel/VTK/build/bin/vtkIOSQLCxxTests" "TestSQLiteTableReadWrite" "/home/ezequiel/VTK/build/ExternalData/IO/SQL/Testing/Data/Input/simple_table.vtk")
set_tests_properties(vtkIOSQLCxx-TestSQLiteTableReadWrite PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkIOSQL" RUN_SERIAL "1")
