#include "slime.h"
#include "paint.h"

int main() {
    auto window = sf::RenderWindow{ { 1920u, 1080u }, "CMake SFML Project" };
    window.setFramerateLimit(144);

    sf::CircleShape circle(200);
    circle.setRadius(40);
    circle.setFillColor(sf::Color(100, 250, 50));
    circle.setPosition(sf::Vector2f(500, 500));


    while (window.isOpen()) {
        for (auto event = sf::Event{}; window.pollEvent(event);) {
            if (event.type == sf::Event::Closed) {
                window.close();
            }
        }
        window.clear();
        window.draw(circle);
        window.display();
    }

    return 0;
}