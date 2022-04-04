cmake_minimum_required(VERSION 3.1.3)
project(Personal-GLIBC-Development-Suite C ASM)

set(CMAKE_EXPORT_COMPILE_COMMANDS on)
add_compile_options(-D_GNU_SOURCE -O3 -Wall -Wpedantic -Wextra -Wno-unused-function -march=native -mtune=native -Wno-variadic-macros -Wno-pointer-arith -std=gnu11)

include_directories("${CMAKE_CURRENT_SOURCE_DIR}/src")

set(EXCLUDE_DIR "/core/")

set(ASM_PATH "${CMAKE_SOURCE_DIR}/src/asm/")

file(GLOB_RECURSE CMAKE_BG21480 "${ASM_PATH}*.c")

file(GLOB_RECURSE ASM_SOURCES "${ASM_PATH}*.S")

list(FILTER ASM_SOURCES EXCLUDE REGEX ".*/core/.*\.S$")

foreach(TMP_PATH ${ASM_SOURCES})
  string(REPLACE ${ASM_PATH} "" ASM_FILE ${TMP_PATH})
  string(REPLACE  ".S" "" ASM_TARGET ${ASM_FILE})

  set_source_files_properties(${TMP_PATH} PROPERTIES COMPILE_FLAGS "-x assembler-with-cpp")
  add_library(${ASM_TARGET} SHARED ${TMP_PATH} ${CMAKE_BG21480})
  target_link_libraries(${ASM_TARGET})
  install(TARGETS ${ASM_TARGET}
    DESTINATION "${CMAKE_CURRENT_SOURCE_DIR}/libs")
endforeach(TMP_PATH)


