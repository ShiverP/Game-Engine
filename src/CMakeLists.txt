set(SOURCE_FILES
    core/Engine.cpp
    graphics/Renderer.cpp
    input/InputHandler.cpp
    physics/PhysicsEngine.cpp
    # Add other source files here
)

add_library(GameEngine STATIC ${SOURCE_FILES})
