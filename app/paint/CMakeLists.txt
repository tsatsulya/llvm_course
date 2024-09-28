cmake_minimum_required(VERSION 3.10)

project(
        paint
        DESCRIPTION "simple pixel drawer"
        LANGUAGES CXX
        )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS False)

set(library_compile_options -O2)

add_library(paint INTERFACE)
target_include_directories(paint INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_compile_features(paint INTERFACE cxx_std_17)

target_compile_options(
        paint INTERFACE
        $<BUILD_INTERFACE:${library_compile_options}>
        )

# target_sources(paint
#     PRIVATE
#     ${CMAKE_CURRENT_SOURCE_DIR}/src/paint.cpp


find_package(SFML COMPONENTS system window graphics REQUIRED)
target_link_libraries(paint INTERFACE sfml-graphics)