cmake_minimum_required(VERSION 3.10)

project(
        display
        DESCRIPTION "simple sdl pixel drawer"
        LANGUAGES C
        )

set(library_compile_options -O2)

add_library(display SHARED sim.c)
target_include_directories(display PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# target_compile_options(display
#         INTERFACE
#         $<BUILD_INTERFACE:${library_compile_options}>
#         )

# target_sources(${PROJECT_NAME}
#        PRIVATE
#                 src/paint.cpp
# )
# target_include_directories(display PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
#                                 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

find_package(SDL2)
target_link_libraries(display SDL2)