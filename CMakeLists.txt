cmake_minimum_required(VERSION 3.10)
project(GameEngine)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add subdirectories
add_subdirectory(src)
add_subdirectory(tests)
add_subdirectory(third_party)

# Include directories
include_directories(include)
