# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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
CMAKE_COMMAND = /home/boyan/Downloads/clion-2017.3.3/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/boyan/Downloads/clion-2017.3.3/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/boyan/Dissertation/dissertation-main/fsyscoordinator

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/fsyscoord.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/fsyscoord.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fsyscoord.dir/flags.make

CMakeFiles/fsyscoord.dir/main.cpp.o: CMakeFiles/fsyscoord.dir/flags.make
CMakeFiles/fsyscoord.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/fsyscoord.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fsyscoord.dir/main.cpp.o -c /home/boyan/Dissertation/dissertation-main/fsyscoordinator/main.cpp

CMakeFiles/fsyscoord.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fsyscoord.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyan/Dissertation/dissertation-main/fsyscoordinator/main.cpp > CMakeFiles/fsyscoord.dir/main.cpp.i

CMakeFiles/fsyscoord.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fsyscoord.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyan/Dissertation/dissertation-main/fsyscoordinator/main.cpp -o CMakeFiles/fsyscoord.dir/main.cpp.s

CMakeFiles/fsyscoord.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/fsyscoord.dir/main.cpp.o.requires

CMakeFiles/fsyscoord.dir/main.cpp.o.provides: CMakeFiles/fsyscoord.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/fsyscoord.dir/build.make CMakeFiles/fsyscoord.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/fsyscoord.dir/main.cpp.o.provides

CMakeFiles/fsyscoord.dir/main.cpp.o.provides.build: CMakeFiles/fsyscoord.dir/main.cpp.o


CMakeFiles/fsyscoord.dir/ansic_log.cpp.o: CMakeFiles/fsyscoord.dir/flags.make
CMakeFiles/fsyscoord.dir/ansic_log.cpp.o: ../ansic_log.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/fsyscoord.dir/ansic_log.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fsyscoord.dir/ansic_log.cpp.o -c /home/boyan/Dissertation/dissertation-main/fsyscoordinator/ansic_log.cpp

CMakeFiles/fsyscoord.dir/ansic_log.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fsyscoord.dir/ansic_log.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/boyan/Dissertation/dissertation-main/fsyscoordinator/ansic_log.cpp > CMakeFiles/fsyscoord.dir/ansic_log.cpp.i

CMakeFiles/fsyscoord.dir/ansic_log.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fsyscoord.dir/ansic_log.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/boyan/Dissertation/dissertation-main/fsyscoordinator/ansic_log.cpp -o CMakeFiles/fsyscoord.dir/ansic_log.cpp.s

CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.requires:

.PHONY : CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.requires

CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.provides: CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.requires
	$(MAKE) -f CMakeFiles/fsyscoord.dir/build.make CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.provides.build
.PHONY : CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.provides

CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.provides.build: CMakeFiles/fsyscoord.dir/ansic_log.cpp.o


# Object files for target fsyscoord
fsyscoord_OBJECTS = \
"CMakeFiles/fsyscoord.dir/main.cpp.o" \
"CMakeFiles/fsyscoord.dir/ansic_log.cpp.o"

# External object files for target fsyscoord
fsyscoord_EXTERNAL_OBJECTS =

fsyscoord: CMakeFiles/fsyscoord.dir/main.cpp.o
fsyscoord: CMakeFiles/fsyscoord.dir/ansic_log.cpp.o
fsyscoord: CMakeFiles/fsyscoord.dir/build.make
fsyscoord: CMakeFiles/fsyscoord.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable fsyscoord"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fsyscoord.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fsyscoord.dir/build: fsyscoord

.PHONY : CMakeFiles/fsyscoord.dir/build

CMakeFiles/fsyscoord.dir/requires: CMakeFiles/fsyscoord.dir/main.cpp.o.requires
CMakeFiles/fsyscoord.dir/requires: CMakeFiles/fsyscoord.dir/ansic_log.cpp.o.requires

.PHONY : CMakeFiles/fsyscoord.dir/requires

CMakeFiles/fsyscoord.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fsyscoord.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fsyscoord.dir/clean

CMakeFiles/fsyscoord.dir/depend:
	cd /home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/boyan/Dissertation/dissertation-main/fsyscoordinator /home/boyan/Dissertation/dissertation-main/fsyscoordinator /home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug /home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug /home/boyan/Dissertation/dissertation-main/fsyscoordinator/cmake-build-debug/CMakeFiles/fsyscoord.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fsyscoord.dir/depend

