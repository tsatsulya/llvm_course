# cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -GNinja ../

cmake_minimum_required (VERSION 3.16)
project(llvm_task_trace)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)


set(MY_COMPILE_FLAGS    "")
set(CMAKE_C_COMPILER    clang)
set(CMAKE_C_FLAGS       "${CMAKE_C_FLAGS} ${MY_COMPILE_FLAGS}")
set(CMAKE_CXX_COMPILER  clang++)
set(CMAKE_CXX_FLAGS     "${CMAKE_CXX_FLAGS} ${MY_COMPILE_FLAGS}")


find_package(LLVM REQUIRED CONFIG)


add_library(compile_llvm_pass SHARED ${CMAKE_CURRENT_SOURCE_DIR}/pass.cpp)
target_include_directories(compile_llvm_pass PUBLIC "${LLVM_INCLUDE_DIRS}")
message(LLVM_INCLUDE_DIRS="${LLVM_INCLUDE_DIRS}")

add_custom_target(run_llvm_pass
    DEPENDS compile_llvm_pass
    COMMAND clang -fpass-plugin=$<TARGET_FILE:compile_llvm_pass>
        -S -emit-llvm -I${APP_SRC_DIR}/paint/include -O2 ${APP_SRC_DIR}/app.cpp -o app.ll
    COMMAND cp pass_log.txt ${CMAKE_CURRENT_SOURCE_DIR}/statistics/pass_log.txt
    COMMAND python3 ${CMAKE_CURRENT_SOURCE_DIR}/stat.py ${CMAKE_CURRENT_SOURCE_DIR}
    SOURCES ${APP_SRC_DIR}/app.cpp
)
