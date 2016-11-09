# CMake generated Testfile for 
# Source directory: /home/ezequiel/VTK/Rendering/GL2PSOpenGL2/Testing/Cxx
# Build directory: /home/ezequiel/VTK/build/Rendering/GL2PSOpenGL2/Testing/Cxx
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive "/home/ezequiel/VTK/build/bin/vtkRenderingGL2PSOpenGL2CxxTests" "TestGL2PSAddPolyPrimitive" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary")
set_tests_properties(vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive PROPERTIES  FAIL_REGULAR_EXPRESSION "(
|^)ERROR: ;instance(s)? still around" LABELS "vtkRenderingGL2PSOpenGL2")
add_test(vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive-RasterizePNG "/usr/bin/cmake" "-DPSFILE=/home/ezequiel/VTK/build/Testing/Temporary/TestGL2PSAddPolyPrimitive.ps" "-DPNGFILE=/home/ezequiel/VTK/build/Testing/Temporary/TestGL2PSAddPolyPrimitive-raster.png" "-DGS_EXECUTABLE=/usr/bin/gs" "-DREMOVEPS=1" "-P" "/home/ezequiel/VTK/CMake/RasterizePostScript.cmake")
set_tests_properties(vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive-RasterizePNG PROPERTIES  DEPENDS "vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive" LABELS "vtkRenderingGL2PSOpenGL2" REQUIRED_FILES "/home/ezequiel/VTK/build/Testing/Temporary/TestGL2PSAddPolyPrimitive.ps")
add_test(vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive-VerifyRasterizedPNG "/home/ezequiel/VTK/build/bin/vtkRenderingGL2PSOpenGL2CxxTests" "PNGCompare" "-D" "/home/ezequiel/VTK/build/ExternalData//Testing" "-T" "/home/ezequiel/VTK/build/Testing/Temporary" "-E" "15" "-V" "/home/ezequiel/VTK/build/ExternalData/Rendering/GL2PSOpenGL2/Testing/Data/Baseline/TestGL2PSAddPolyPrimitive-rasterRef.png" "--test-file" "/home/ezequiel/VTK/build/Testing/Temporary/TestGL2PSAddPolyPrimitive-raster.png")
set_tests_properties(vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive-VerifyRasterizedPNG PROPERTIES  DEPENDS "vtkRenderingGL2PSOpenGL2Cxx-TestGL2PSAddPolyPrimitive-RasterizePNG" LABELS "vtkRenderingGL2PSOpenGL2" REQUIRED_FILES "/home/ezequiel/VTK/build/Testing/Temporary/TestGL2PSAddPolyPrimitive-raster.png")
