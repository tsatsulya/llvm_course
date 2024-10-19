#define SIM_X_SIZE 400
#define SIM_Y_SIZE 400

void simFlush();
void simPutDisplayPixel(int x, int y, int argb, int scale);

extern void simInit();
extern void app();
extern void simExit();