cmake_minimum_required(VERSION 3.28)
project(llvm_task LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
add_executable(llvm_task main.cpp)

add_subdirectory(slime)
add_subdirectory(paint)
target_link_libraries(llvm_task PUBLIC paint slimee)