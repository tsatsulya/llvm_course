#include <cassert>
#include <random>

#include <SFML/Graphics.hpp>
#include <SFML/Graphics/RenderWindow.hpp>
#include <SFML/System/Vector2.hpp>
#include <SFML/Window/VideoMode.hpp>


#include "paint.h"
#include <unistd.h>


struct window final {
    size_t x_size, y_size;

    private:
        sf::Image buffer{};
        sf::RenderWindow rendered_window{};
        // sf::Event event;
    public:
        window(const size_t x_size_, const size_t y_size_, const char *window_name) :
        x_size(x_size_), y_size(y_size_) {
            buffer.create(x_size, y_size, sf::Color{0, 0, 0});
            rendered_window.create(sf::VideoMode(800, 600, 32), window_name, sf::Style::Fullscreen);
            assert(rendered_window.isOpen());
        }

        void set_pixel(const size_t x, const size_t y, int r, int g, int b) {
            assert(x < x_size && x >= 0);
            assert(y < y_size && y >= 0);
            sf::Color color(r, g, b);
            buffer.setPixel(x, y, color);
        }

        bool update_display() noexcept {
            usleep(500);
            sf::Texture texture;
            texture.loadFromImage(buffer);
            sf::Sprite sprite;
            sprite.setTexture(texture, true);

            rendered_window.clear();
            rendered_window.draw(sprite);
            rendered_window.display();
            return true;
        }

        void display() {
            rendered_window.display();
        }
};

window *display = nullptr;


bool random_bool() {
  static std::default_random_engine generator(std::random_device{}());
  // With p = 0.5 you get equal probability for true and false
  static std::bernoulli_distribution distribution(0.5);
  return distribution(generator);
}


extern "C" {

void generate_char_field(char *field) {
    for (int i = 0; i < window_size_x * window_size_y; ++i) {
        field[i] = random_bool();
    }
}

void create_window() {
    display = new window{window_size_x, window_size_y, "ssdsssdsd"};
}

void set_pixel(int x, int y, int r, int g, int b) {
    assert(display);

    assert(x >= 0 && x < window_size_x);
    assert(y >= 0 && y < window_size_y);

    assert(r >= 0 && g >= 0 && b >= 0);
    display->set_pixel(x, y, r, g, b);
}

int update_window() {
    assert(display);
    return display->update_display();
}

} // extern "C"
