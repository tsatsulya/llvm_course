cmake_minimum_required(VERSION 3.10)

project(
        llvm_task_app
        DESCRIPTION "simple app for llvm course"
        LANGUAGES C
        )

add_subdirectory(sdl)
set(SDL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/sdl)
add_subdirectory(sin)
set(FPSIN_DIR ${CMAKE_CURRENT_SOURCE_DIR}/sin)


set(CMAKE_C_COMPILER clang)
add_executable(llvm_task_app main.c)

target_sources(llvm_task_app PRIVATE app.c)

target_compile_options(llvm_task_app PUBLIC ${CMAKE_C_FLAGS})
target_link_libraries(llvm_task_app PUBLIC display fpsin)


add_custom_command(
        TARGET llvm_task_app
        COMMAND clang ${CMAKE_CURRENT_SOURCE_DIR}/app.c -I${SDL_DIR} -I${FPSIN_DIR}/include -emit-llvm -S -O2  -o app.ll
        DEPENDS llvm_task_app
)
