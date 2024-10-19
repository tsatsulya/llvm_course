cmake_minimum_required(VERSION 3.10)

project(
        fpsin
        LANGUAGES CXX
        )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS False)
set(library_compile_options -O2)

add_library(fpsin SHARED src/fpsin.cpp)
target_include_directories(fpsin PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

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

# target_link_libraries(display INTERFACE sfml-graphics)