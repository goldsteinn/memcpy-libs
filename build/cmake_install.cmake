# Install script for directory: /home/noah/programs/projects/memcpylibs

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
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-avx-head.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-avx-head.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-avx-head.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/noah/programs/projects/memcpylibs/libs/libmemcpy-avx-head.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/noah/programs/projects/memcpylibs/libs" TYPE SHARED_LIBRARY FILES "/home/noah/programs/projects/memcpylibs/build/libmemcpy-avx-head.so")
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-avx-head.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-avx-head.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-avx-head.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-sse2-head.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-sse2-head.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-sse2-head.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/noah/programs/projects/memcpylibs/libs/libmemcpy-sse2-head.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/noah/programs/projects/memcpylibs/libs" TYPE SHARED_LIBRARY FILES "/home/noah/programs/projects/memcpylibs/build/libmemcpy-sse2-head.so")
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-sse2-head.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-sse2-head.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-sse2-head.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v1.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v1.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v1.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v1.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/noah/programs/projects/memcpylibs/libs" TYPE SHARED_LIBRARY FILES "/home/noah/programs/projects/memcpylibs/build/libmemcpy-ssse3-dev-v1.so")
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v1.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v1.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v1.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v2.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v2.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v2.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v2.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/noah/programs/projects/memcpylibs/libs" TYPE SHARED_LIBRARY FILES "/home/noah/programs/projects/memcpylibs/build/libmemcpy-ssse3-dev-v2.so")
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v2.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v2.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-dev-v2.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-glibc.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-glibc.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-glibc.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-glibc.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/noah/programs/projects/memcpylibs/libs" TYPE SHARED_LIBRARY FILES "/home/noah/programs/projects/memcpylibs/build/libmemcpy-ssse3-glibc.so")
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-glibc.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-glibc.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemcpy-ssse3-glibc.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemmove-ssse3-glibc.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemmove-ssse3-glibc.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemmove-ssse3-glibc.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/noah/programs/projects/memcpylibs/libs/libmemmove-ssse3-glibc.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/noah/programs/projects/memcpylibs/libs" TYPE SHARED_LIBRARY FILES "/home/noah/programs/projects/memcpylibs/build/libmemmove-ssse3-glibc.so")
  if(EXISTS "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemmove-ssse3-glibc.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemmove-ssse3-glibc.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/noah/programs/projects/memcpylibs/libs/libmemmove-ssse3-glibc.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/noah/programs/projects/memcpylibs/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
