#ifndef OUTPUT_FROM_CPP_H
#define OUTPUT_FROM_CPP_H

#ifdef __cplusplus
// Building with a C++ compiler
# include <cstdint>
extern "C" {
#else
// Building with a C compiler
# include <stdint.h>
#endif
int16_t fpsin(int16_t i);
#ifdef __cplusplus
}  // Match extern "C"
#endif

#endif

constexpr int window_size_y = 500;
constexpr int window_size_x = 400;
