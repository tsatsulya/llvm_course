// #include "sim.h"

// void initMatrix(unsigned int matrix[x_size][y_size])
// {
// 	for (int y = 0; y < y_size; ++y)
// 	{
// 		for (int x = 0; x < x_size; ++x)
// 		{
// 			if (x < 10 || y < 10)
// 			{
// 				matrix[x][y] = 0xFF00FF00;
// 			}
//             else if (x > x_size / 4 * 1 && x < x_size / 4 * 1 + 10) {
//                 matrix[x][y] = 0xFFFF0000;
//             }
//             else if (x > x_size / 4 * 2 && x < x_size / 4 * 2 + 10) {
//                 matrix[x][y] = 0xFF0000FF;
//             }
//             else if (x > x_size / 4 * 3 && x < x_size / 4 * 3 + 10) {
//                 matrix[x][y] = 0xFFFFFFFF;
//             }
// 			else
// 			{
// 				matrix[x][y] = 0xFF000000;
// 			}
// 		}
// 	}
// }

// void updateMatrix(unsigned int matrix[x_size][y_size])
// {
// 	for (int y = 0; y < y_size - 1; ++y)
// 	{
// 		for (int x = x_size - 1; x > 0; --x)
// 		{
// 			matrix[x][y] = matrix[x - 1][y] / 4 + matrix[x][y] / 4 + matrix[x][y + 1] / 4 + matrix[x - 1][y + 1] / 4;
// 		}
// 	}
// }

// void drawMatrix(unsigned int matrix[x_size][y_size])
// {
// 	for (int y = 0; y < y_size; ++y)
// 		for (int x = 0; x < x_size; ++x)
// 		{
// 			simPutPixel(x, y, matrix[x][y]);
// 		}

// 	simFlush();
// }

// void app()
// {
// 	unsigned int matrix[x_size][y_size];
// 	initMatrix(matrix);

// 	for (int step = 0; step < 1000; ++step)
// 	{
// 		drawMatrix(matrix);
// 		updateMatrix(matrix);
// 	}
// }


#include "sim.h"

#define x_size 400
#define y_size 500


char is_border(int location) {
    if (location % y_size == 0 || location % y_size == y_size - 1)
        return 1;
    if (location / y_size == 0 || location / y_size == x_size - 1)
        return 1;
    return 0;
}

int get_neighbours_amount(int location, char *alive_map, int y_left,
                          int y_right, int x_left, int x_right) {
    int neighbours_amount = 0;
    for (int x = x_left; x <= x_right; ++x) {
        for (int y = y_left; y <= y_right; ++y) {
            if (alive_map[x * x_size + y]) {
                neighbours_amount++;
            }
        }
    }

    return neighbours_amount;
}

char check_rule(int neighbours_amount, char is_alive) {
    if (is_alive && neighbours_amount < 2) return 0;
    if (is_alive && neighbours_amount > 3) return 0;
    if (!is_alive && neighbours_amount == 3) return 1;
    return is_alive;
}

char update_nonborder_cell(int location, char *alive_map) {
    int x_loc = location / y_size;
    int y_loc = location % y_size;

    int is_alive = alive_map[location];
    int neighbours_amount = get_neighbours_amount(location, alive_map,
                                          y_loc - 1, y_loc + 1, x_loc - 1, x_loc + 1);
    return check_rule(neighbours_amount, is_alive);
}

void set_range(int location, int *y_left, int *y_right, int *x_left, int *x_right) {
    int x_loc = location / y_size;
    int y_loc = location % y_size;
    *y_left = y_loc - 1;
    *y_right = y_loc + 1;
    *x_left = x_loc - 1;
    *x_right = x_loc + 1;

    if (y_loc == 0) *y_left = 0;
    if (y_loc == y_size - 1) *y_right = y_loc;
    if (x_loc == 0) *x_left = 0;
    if (x_loc == x_size - 1) *x_right = x_loc;
}

char update_border_cell(int location, char *alive_map) {

    int is_alive = alive_map[location];

    int y_left, y_right, x_left, x_right;
    set_range(location, &y_left, &y_right, &x_left, &x_right);
    int neighbours_amount = get_neighbours_amount(location, alive_map, y_left, y_right, x_left, x_right);
    return check_rule(neighbours_amount, is_alive);
}

void copy_map(char *empty, char *full) {
    for (int loc = 0; loc < x_size * y_size; ++loc) {
        empty[loc] = full[loc];
    }
}

void update_map(char *alive_map) {
    char tmp_map[x_size * y_size];
    copy_map(tmp_map, alive_map);
    for (int loc = 0; loc < x_size * y_size; ++loc) {
        if (!is_border(loc))
            alive_map[loc] = update_nonborder_cell(loc, tmp_map);
        else
            alive_map[loc] = update_border_cell(loc, tmp_map);

        if (alive_map[loc])
            set_pixel(loc / y_size, loc % y_size, 255, 0, 0);
        else
            set_pixel(loc / y_size, loc % y_size, 0, 0, 0);
    }
    flush();
}

void generate_char_field(char *field) {
    for (int i = 0; i < x_size * y_size; i++) {
        field[i] = custom_rand();
    }
}

void app() {
    init();

    char alive_map[x_size * y_size];
    generate_char_field(alive_map);

    for (int step = 0; step < 100000; step++) {
        update_map(alive_map);
    }

    window_exit();

}


