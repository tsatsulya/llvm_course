static_assert(sizeof(int) == 4);
static_assert(sizeof(long long) == 8);

extern "C" {

constexpr int window_size_x = 400;
constexpr int window_size_y = 500;

void create_window();
void set_pixel(int x, int y, int r, int g, int b);
int update_window();
void generate_char_field(char *field);
int is_clear_event();
} // extern "C"
