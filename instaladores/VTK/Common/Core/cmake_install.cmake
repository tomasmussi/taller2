# Install script for directory: /home/ezequiel/VTK/Common/Core

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "RuntimeLibraries")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/ezequiel/VTK/build/lib/libvtkCommonCore-7.1.so.1"
    "/home/ezequiel/VTK/build/lib/libvtkCommonCore-7.1.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonCore-7.1.so.1"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libvtkCommonCore-7.1.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/ezequiel/VTK/build/lib:"
           NEW_RPATH "")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/vtk-7.1/Modules" TYPE FILE FILES "/home/ezequiel/VTK/build/Common/Core/CMakeFiles/vtkCommonCore.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/vtk-7.1" TYPE FILE FILES
    "/home/ezequiel/VTK/Common/Core/vtkABI.h"
    "/home/ezequiel/VTK/Common/Core/vtkAngularPeriodicDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayDispatch.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayDispatch.txx"
    "/home/ezequiel/VTK/Common/Core/vtkArrayInterpolate.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayInterpolate.txx"
    "/home/ezequiel/VTK/Common/Core/vtkArrayIteratorIncludes.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayIteratorTemplateImplicit.txx"
    "/home/ezequiel/VTK/Common/Core/vtkArrayPrint.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayPrint.txx"
    "/home/ezequiel/VTK/Common/Core/vtkAssume.h"
    "/home/ezequiel/VTK/Common/Core/vtkAtomicTypeConcepts.h"
    "/home/ezequiel/VTK/Common/Core/vtkAtomicTypes.h"
    "/home/ezequiel/VTK/Common/Core/vtkAutoInit.h"
    "/home/ezequiel/VTK/Common/Core/vtkBuffer.h"
    "/home/ezequiel/VTK/Common/Core/vtkDataArrayAccessor.h"
    "/home/ezequiel/VTK/Common/Core/vtkDataArrayIteratorMacro.h"
    "/home/ezequiel/VTK/Common/Core/vtkDataArrayTemplate.h"
    "/home/ezequiel/VTK/Common/Core/vtkGenericDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkGenericDataArrayLookupHelper.h"
    "/home/ezequiel/VTK/Common/Core/vtkGenericDataArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkIOStream.h"
    "/home/ezequiel/VTK/Common/Core/vtkIOStreamFwd.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationInternals.h"
    "/home/ezequiel/VTK/Common/Core/vtkMappedDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkMathUtilities.h"
    "/home/ezequiel/VTK/Common/Core/vtkMersenneTwister.h"
    "/home/ezequiel/VTK/Common/Core/vtkNew.h"
    "/home/ezequiel/VTK/Common/Core/vtkPeriodicDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkSetGet.h"
    "/home/ezequiel/VTK/Common/Core/vtkSmartPointer.h"
    "/home/ezequiel/VTK/Common/Core/vtkSOADataArrayTemplate.h"
    "/home/ezequiel/VTK/Common/Core/vtkSOADataArrayTemplate.txx"
    "/home/ezequiel/VTK/Common/Core/vtkTemplateAliasMacro.h"
    "/home/ezequiel/VTK/Common/Core/vtkTestDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkTypeList.h"
    "/home/ezequiel/VTK/Common/Core/vtkTypeList.txx"
    "/home/ezequiel/VTK/Common/Core/vtkTypeTraits.h"
    "/home/ezequiel/VTK/Common/Core/vtkTypedDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkTypedDataArrayIterator.h"
    "/home/ezequiel/VTK/Common/Core/vtkVariantCast.h"
    "/home/ezequiel/VTK/Common/Core/vtkVariantCreate.h"
    "/home/ezequiel/VTK/Common/Core/vtkVariantExtract.h"
    "/home/ezequiel/VTK/Common/Core/vtkVariantInlineOperators.h"
    "/home/ezequiel/VTK/Common/Core/vtkWeakPointer.h"
    "/home/ezequiel/VTK/Common/Core/vtkWin32Header.h"
    "/home/ezequiel/VTK/Common/Core/vtkWindows.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkArrayDispatchArrayList.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkToolkits.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeListMacros.h"
    "/home/ezequiel/VTK/Common/Core/vtkAbstractArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkAngularPeriodicDataArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkAngularPeriodicDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkAnimationCue.h"
    "/home/ezequiel/VTK/Common/Core/vtkAOSDataArrayTemplate.txx"
    "/home/ezequiel/VTK/Common/Core/vtkAOSDataArrayTemplate.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayCoordinates.h"
    "/home/ezequiel/VTK/Common/Core/vtkArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayExtents.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayExtentsList.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayIterator.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayIteratorTemplate.txx"
    "/home/ezequiel/VTK/Common/Core/vtkArrayIteratorTemplate.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayRange.h"
    "/home/ezequiel/VTK/Common/Core/vtkArraySort.h"
    "/home/ezequiel/VTK/Common/Core/vtkArrayWeights.h"
    "/home/ezequiel/VTK/Common/Core/vtkBitArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkBitArrayIterator.h"
    "/home/ezequiel/VTK/Common/Core/vtkBoxMuellerRandomSequence.h"
    "/home/ezequiel/VTK/Common/Core/vtkBreakPoint.h"
    "/home/ezequiel/VTK/Common/Core/vtkByteSwap.h"
    "/home/ezequiel/VTK/Common/Core/vtkCallbackCommand.h"
    "/home/ezequiel/VTK/Common/Core/vtkCharArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkCollection.h"
    "/home/ezequiel/VTK/Common/Core/vtkCollectionIterator.h"
    "/home/ezequiel/VTK/Common/Core/vtkCommand.h"
    "/home/ezequiel/VTK/Common/Core/vtkCommonInformationKeyManager.h"
    "/home/ezequiel/VTK/Common/Core/vtkConditionVariable.h"
    "/home/ezequiel/VTK/Common/Core/vtkCriticalSection.h"
    "/home/ezequiel/VTK/Common/Core/vtkDataArrayCollection.h"
    "/home/ezequiel/VTK/Common/Core/vtkDataArrayCollectionIterator.h"
    "/home/ezequiel/VTK/Common/Core/vtkDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkDataArraySelection.h"
    "/home/ezequiel/VTK/Common/Core/vtkDebugLeaks.h"
    "/home/ezequiel/VTK/Common/Core/vtkDebugLeaksManager.h"
    "/home/ezequiel/VTK/Common/Core/vtkDoubleArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkDynamicLoader.h"
    "/home/ezequiel/VTK/Common/Core/vtkEventForwarderCommand.h"
    "/home/ezequiel/VTK/Common/Core/vtkFileOutputWindow.h"
    "/home/ezequiel/VTK/Common/Core/vtkFloatArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkFloatingPointExceptions.h"
    "/home/ezequiel/VTK/Common/Core/vtkGarbageCollector.h"
    "/home/ezequiel/VTK/Common/Core/vtkGarbageCollectorManager.h"
    "/home/ezequiel/VTK/Common/Core/vtkGaussianRandomSequence.h"
    "/home/ezequiel/VTK/Common/Core/vtkIdListCollection.h"
    "/home/ezequiel/VTK/Common/Core/vtkIdList.h"
    "/home/ezequiel/VTK/Common/Core/vtkIdTypeArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkIndent.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformation.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationDataObjectKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationDoubleKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationDoubleVectorKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationIdTypeKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationInformationKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationInformationVectorKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationIntegerKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationIntegerPointerKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationIntegerVectorKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationIterator.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationKeyLookup.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationKeyVectorKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationObjectBaseKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationObjectBaseVectorKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationRequestKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationStringKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationStringVectorKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationUnsignedLongKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationVariantKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationVariantVectorKey.h"
    "/home/ezequiel/VTK/Common/Core/vtkInformationVector.h"
    "/home/ezequiel/VTK/Common/Core/vtkInstantiator.h"
    "/home/ezequiel/VTK/Common/Core/vtkIntArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkLargeInteger.h"
    "/home/ezequiel/VTK/Common/Core/vtkLongArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkLongLongArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkLookupTable.h"
    "/home/ezequiel/VTK/Common/Core/vtkMappedDataArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkMappedDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkMath.h"
    "/home/ezequiel/VTK/Common/Core/vtkMersenneTwister.h"
    "/home/ezequiel/VTK/Common/Core/vtkMinimalStandardRandomSequence.h"
    "/home/ezequiel/VTK/Common/Core/vtkMultiThreader.h"
    "/home/ezequiel/VTK/Common/Core/vtkMutexLock.h"
    "/home/ezequiel/VTK/Common/Core/vtkObjectBase.h"
    "/home/ezequiel/VTK/Common/Core/vtkObject.h"
    "/home/ezequiel/VTK/Common/Core/vtkObjectFactoryCollection.h"
    "/home/ezequiel/VTK/Common/Core/vtkObjectFactory.h"
    "/home/ezequiel/VTK/Common/Core/vtkOldStyleCallbackCommand.h"
    "/home/ezequiel/VTK/Common/Core/vtkOStreamWrapper.h"
    "/home/ezequiel/VTK/Common/Core/vtkOStrStreamWrapper.h"
    "/home/ezequiel/VTK/Common/Core/vtkOutputWindow.h"
    "/home/ezequiel/VTK/Common/Core/vtkOverrideInformationCollection.h"
    "/home/ezequiel/VTK/Common/Core/vtkOverrideInformation.h"
    "/home/ezequiel/VTK/Common/Core/vtkPeriodicDataArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkPeriodicDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkPoints2D.h"
    "/home/ezequiel/VTK/Common/Core/vtkPoints.h"
    "/home/ezequiel/VTK/Common/Core/vtkPriorityQueue.h"
    "/home/ezequiel/VTK/Common/Core/vtkRandomSequence.h"
    "/home/ezequiel/VTK/Common/Core/vtkReferenceCount.h"
    "/home/ezequiel/VTK/Common/Core/vtkScalarsToColors.h"
    "/home/ezequiel/VTK/Common/Core/vtkShortArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkSignedCharArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkSimpleCriticalSection.h"
    "/home/ezequiel/VTK/Common/Core/vtkSmartPointerBase.h"
    "/home/ezequiel/VTK/Common/Core/vtkSOADataArrayTemplate.txx"
    "/home/ezequiel/VTK/Common/Core/vtkSOADataArrayTemplate.h"
    "/home/ezequiel/VTK/Common/Core/vtkSortDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkStdString.h"
    "/home/ezequiel/VTK/Common/Core/vtkStringArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkStringOutputWindow.h"
    "/home/ezequiel/VTK/Common/Core/vtkTimePointUtility.h"
    "/home/ezequiel/VTK/Common/Core/vtkTimeStamp.h"
    "/home/ezequiel/VTK/Common/Core/vtkTypedDataArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkTypedDataArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkUnicodeStringArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkUnicodeString.h"
    "/home/ezequiel/VTK/Common/Core/vtkUnsignedCharArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkUnsignedIntArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkUnsignedLongArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkUnsignedLongLongArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkUnsignedShortArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkVariantArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkVariant.h"
    "/home/ezequiel/VTK/Common/Core/vtkVersion.h"
    "/home/ezequiel/VTK/Common/Core/vtkVoidArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkWeakPointerBase.h"
    "/home/ezequiel/VTK/Common/Core/vtkWindow.h"
    "/home/ezequiel/VTK/Common/Core/vtkXMLFileOutputWindow.h"
    "/home/ezequiel/VTK/Common/Core/vtkDenseArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkDenseArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkSparseArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkSparseArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkTypedArray.txx"
    "/home/ezequiel/VTK/Common/Core/vtkTypedArray.h"
    "/home/ezequiel/VTK/Common/Core/vtkTypeTemplate.h"
    "/home/ezequiel/VTK/Common/Core/vtkType.h"
    "/home/ezequiel/VTK/Common/Core/vtkSystemIncludes.h"
    "/home/ezequiel/VTK/Common/Core/vtkWrappingHints.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkAtomic.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkSMPToolsInternal.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkSMPThreadLocal.h"
    "/home/ezequiel/VTK/Common/Core/vtkSMPTools.h"
    "/home/ezequiel/VTK/Common/Core/vtkSMPThreadLocalObject.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkConfigure.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkMathConfigure.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkVersionMacros.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeInt8Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeInt16Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeInt32Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeInt64Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeUInt8Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeUInt16Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeUInt32Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeUInt64Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeFloat32Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkTypeFloat64Array.h"
    "/home/ezequiel/VTK/build/Common/Core/vtkCommonCoreModule.h"
    )
endif()

