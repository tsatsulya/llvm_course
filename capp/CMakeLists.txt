cmake_minimum_required(VERSION 3.10)

project(
        llvm_task
        DESCRIPTION "simple app for llvm course"
        LANGUAGES CXX
        )

add_subdirectory(paint)

set(CMAKE_C_COMPILER clang)
add_executable(llvm_task app.cpp)

target_compile_options(llvm_task PUBLIC ${CMAKE_C_FLAGS})
target_link_libraries(llvm_task PUBLIC display)

add_custom_command(
        TARGET llvm_task
        POST_BUILD
        COMMAND ${CMAKE_C_COMPILER} ${CMAKE_CURRENT_SOURCE_DIR}/app.cpp -emit-llvm -I${CMAKE_CURRENT_SOURCE_DIR}/paint/include -S -O2 -o ${CMAKE_CURRENT_SOURCE_DIR}/app.ll
)
