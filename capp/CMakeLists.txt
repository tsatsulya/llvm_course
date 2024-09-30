cmake_minimum_required(VERSION 3.10)

project(
        llvm_task
        DESCRIPTION "simple app for llvm course"
        LANGUAGES CXX
        )

add_executable(llvm_task app.cpp)
add_subdirectory(paint)
target_link_libraries(llvm_task PUBLIC display)

