cmake_minimum_required (VERSION 3.16)
project(llvm_course)

set(APP_SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/capp)

add_subdirectory(capp)
add_subdirectory(trace)
