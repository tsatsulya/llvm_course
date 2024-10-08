cmake_minimum_required(VERSION 3.10)

project(
        llvm_task_app
        DESCRIPTION "simple app for llvm course"
        LANGUAGES CXX
        )

add_subdirectory(paint)
add_subdirectory(fpsin)

set(CMAKE_C_COMPILER clang)
add_executable(llvm_task_app app.cpp)

target_compile_options(llvm_task_app PUBLIC ${CMAKE_C_FLAGS})
target_link_libraries(llvm_task_app PUBLIC display fpsin)