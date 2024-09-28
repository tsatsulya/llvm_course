#include <cassert>

#include <SFML/Graphics.hpp>
#include <SFML/Graphics/RenderWindow.hpp>
#include <SFML/System/Vector2.hpp>
#include <SFML/Window/VideoMode.hpp>

struct window final {
    size_t x_size, y_size;

    private:
        sf::Image buffer{};
        sf::RenderWindow rendered_window{};

    public:
        window(const size_t x_size_, const size_t y_size_, const char *window_name) :
        x_size(x_size_), y_size(y_size_) {
            buffer.create(x_size, y_size, sf::Color{0, 0, 0});
            rendered_window.create(sf::VideoMode(x_size, y_size), window_name);
            assert(rendered_window.isOpen());
        }

        void set_pixel(const size_t x, const size_t y, sf::Color color) {
            assert(x < x_size && x >= 0);
            assert(y < y_size && y >= 0);

            buffer.setPixel(x, y, color);
        }

        void update_display() noexcept {
            sf::Texture texture;
            texture.loadFromImage(buffer);
            sf::Sprite sprite;
            sprite.setTexture(texture, true);

            rendered_window.clear();
            rendered_window.draw(sprite);
            rendered_window.display();
        }

        void display() {
            rendered_window.display();
        }
};