#!/bin/bash

# Ensure you are in the root directory of your Git repository
if [ ! -d ".git" ]; then
    echo "This script must be run from the root directory of your Git repository."
    exit 1
fi

# Create main directories
mkdir -p build docs include/core include/graphics include/input include/physics src/core src/graphics src/input src/physics tests tools examples third_party assets

# Create initial CMakeLists.txt files
cat <<EOL > CMakeLists.txt
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
EOL

cat <<EOL > src/CMakeLists.txt
set(SOURCE_FILES
    core/Engine.cpp
    graphics/Renderer.cpp
    input/InputHandler.cpp
    physics/PhysicsEngine.cpp
    # Add other source files here
)

add_library(GameEngine STATIC \${SOURCE_FILES})
EOL

# Create initial header files
cat <<EOL > include/core/Engine.h
#ifndef ENGINE_H
#define ENGINE_H

namespace core {
    class Engine {
    public:
        void initialize();
        void run();
        void shutdown();
    };
}

#endif // ENGINE_H
EOL

# Create initial source files
cat <<EOL > src/core/Engine.cpp
#include "core/Engine.h"

namespace core {
    void Engine::initialize() {
        // Initialization code
    }

    void Engine::run() {
        // Main loop code
    }

    void Engine::shutdown() {
        // Cleanup code
    }
}
EOL

# Create README.md
echo "# GameEngine" > README.md

# Create .gitignore
cat <<EOL > .gitignore
# Ignore build files
/build/

# Ignore OS-specific files
.DS_Store
Thumbs.db

# Ignore CMake files
CMakeFiles/
CMakeCache.txt
cmake_install.cmake

# Ignore editor files
*.swp
*.swo
*.user
.idea/
.vscode/
EOL

# Stage all files
git add .

# Commit the initial project setup
git commit -m "Initial project structure setup"

echo "Project structure created and committed to the 'main' branch successfully."

