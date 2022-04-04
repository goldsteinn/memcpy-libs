# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/noah/programs/projects/memcpylibs

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/noah/programs/projects/memcpylibs/build

# Include any dependencies generated for this target.
include CMakeFiles/memcpy-sse2-head.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/memcpy-sse2-head.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/memcpy-sse2-head.dir/flags.make

CMakeFiles/memcpy-sse2-head.dir/src/asm/memcpy-sse2-head.S.o: CMakeFiles/memcpy-sse2-head.dir/flags.make
CMakeFiles/memcpy-sse2-head.dir/src/asm/memcpy-sse2-head.S.o: ../src/asm/memcpy-sse2-head.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/noah/programs/projects/memcpylibs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM object CMakeFiles/memcpy-sse2-head.dir/src/asm/memcpy-sse2-head.S.o"
	/usr/bin/cc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -x assembler-with-cpp -o CMakeFiles/memcpy-sse2-head.dir/src/asm/memcpy-sse2-head.S.o -c /home/noah/programs/projects/memcpylibs/src/asm/memcpy-sse2-head.S

CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.o: CMakeFiles/memcpy-sse2-head.dir/flags.make
CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.o: ../src/asm/empty.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/noah/programs/projects/memcpylibs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.o   -c /home/noah/programs/projects/memcpylibs/src/asm/empty.c

CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/noah/programs/projects/memcpylibs/src/asm/empty.c > CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.i

CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/noah/programs/projects/memcpylibs/src/asm/empty.c -o CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.s

# Object files for target memcpy-sse2-head
memcpy__sse2__head_OBJECTS = \
"CMakeFiles/memcpy-sse2-head.dir/src/asm/memcpy-sse2-head.S.o" \
"CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.o"

# External object files for target memcpy-sse2-head
memcpy__sse2__head_EXTERNAL_OBJECTS =

libmemcpy-sse2-head.so: CMakeFiles/memcpy-sse2-head.dir/src/asm/memcpy-sse2-head.S.o
libmemcpy-sse2-head.so: CMakeFiles/memcpy-sse2-head.dir/src/asm/empty.c.o
libmemcpy-sse2-head.so: CMakeFiles/memcpy-sse2-head.dir/build.make
libmemcpy-sse2-head.so: CMakeFiles/memcpy-sse2-head.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/noah/programs/projects/memcpylibs/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library libmemcpy-sse2-head.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/memcpy-sse2-head.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/memcpy-sse2-head.dir/build: libmemcpy-sse2-head.so

.PHONY : CMakeFiles/memcpy-sse2-head.dir/build

CMakeFiles/memcpy-sse2-head.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/memcpy-sse2-head.dir/cmake_clean.cmake
.PHONY : CMakeFiles/memcpy-sse2-head.dir/clean

CMakeFiles/memcpy-sse2-head.dir/depend:
	cd /home/noah/programs/projects/memcpylibs/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/noah/programs/projects/memcpylibs /home/noah/programs/projects/memcpylibs /home/noah/programs/projects/memcpylibs/build /home/noah/programs/projects/memcpylibs/build /home/noah/programs/projects/memcpylibs/build/CMakeFiles/memcpy-sse2-head.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/memcpy-sse2-head.dir/depend

