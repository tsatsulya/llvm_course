#define _USE_MATH_DEFINES
#include <math.h>
#include <cstdint>
#include <iostream>

#include "fpsin.h"

int main(void)
{
    int32_t max = 0, min = 0;
    uint16_t t = 0;
    int32_t x_freq = 3;
    int32_t y_freq = 5;
    int32_tphase_shift;

    while(true) {
        int16_t x =
    }
    for(uint16_t t = 0; t <= 32768; ++t) {
        int32_t s = lround(4096*sin(2*M_PI * i / 32768));
        int16_t s5d = fpsin(i);
        int32_t err = s - s5d;
        if(err > max)
            max = err;
        if(err < min)
            min = err;
        printf("The value of %i is %i - compare %i, diff : %i\n", i, s5d, s, err);
    }

    printf("min: %i max: %i\n", min, max);
    return 0;
}
