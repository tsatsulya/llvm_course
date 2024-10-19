#include "sim.h"
#include "fpsin.h"
#include <unistd.h>

#define X_SIZE 600
#define Y_SIZE 600

#define A 11
#define B 5
#define PI 8192
#define scality 10


void app(void) {
    simInit();
    char alive[Y_SIZE][X_SIZE];

    short x, y;
    for (int t = 0; t < PI * 8; t+=scality) {
        x = fpsin(A * t + PI / 6) / 100 + 50;
        y = fpsin(B * t) / 100 + 50;
        usleep(10000);
        simPutDisplayPixel(x, y, 0xff9999, 4);
        simFlush();
    }

    // app();
    simExit();
}