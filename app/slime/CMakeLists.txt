cmake_minimum_required(VERSION 3.10)

project(
        slime
        DESCRIPTION "cellural automata slime impl"
        LANGUAGES CXX
        )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS False)

set(library_compile_options -O2)

add_library(slimee INTERFACE)
target_include_directories(slimee INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_compile_features(slimee INTERFACE cxx_std_17)

target_compile_options(
        slimee INTERFACE
        $<BUILD_INTERFACE:${library_compile_options}>
        )
target_sources(slimee
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/slime.cpp
    )