#define x_size 400
#define y_size 500

#ifndef __sim__
void flush();
void set_pixel(int x, int y, int r, int g, int b);
int custom_rand();
#endif

extern void init();
extern void app();
extern void window_exit();