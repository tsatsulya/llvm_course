#             2
#        3         1
#    4      angle      0
#        5         7
#             6


FIELD_SIZE = 10

step = {
    0: {'x': 1,     'y': 0},
    1: {'x': 1,     'y': 1},
    2: {'x': 0,     'y': 1},
    3: {'x': -1,    'y': 1},
    4: {'x': -1,    'y': 0},
    5: {'x': -1,    'y': -1},
    6: {'x': 0,     'y': -1},
    7: {'x': 1,     'y': -1},
}

def get_pheromone_amount(pheromone_map, coords):
    return pheromone_map[coords['x']][coords['y']]

def get_best_direction(pheromone_map, x, y, angle):
    max_smell = 0
    best_dir = 0
    updated = 0
    possible = []
    for d in range(-1, 2):
        dc = step[(angle + d) % 8]
        dx = x + dc['x']
        dy = y + dc['y']
        # print('MAYBE ', dx, dy)
        if dx < 0 or dx >= FIELD_SIZE -1  or \
            dy < 0 or dy >= FIELD_SIZE - 1 :
            continue
        updated = True
        possible.append(d)
        pheromone = pheromone_map[dx][dy]
        if pheromone >= max_smell:
            # print("YES")
            max_smell = pheromone
            best_dir = d

    if not updated:
        best_dir = -2
    return {"angle": best_dir, 'possible': possible}



class agent:
    def __init__(self, x_, y_, speed_, pheromone_intensity_, angle_):
        self.x = x_
        self.y = y_
        self.speed = speed_
        self.pheromone_intensity = pheromone_intensity_
        self.angle = angle_

    is_alive = True
    def move(self, pheromone_map):
        best_dir = get_best_direction(pheromone_map, self.x, self.y, self.angle)
        if best_dir['angle'] == -2:
            self.angle = (4 + self.angle) % 8
        else:
            self.angle = (self.angle + best_dir['angle']) % 8
            if random.randint(0, 100) < 5:
                p = best_dir['possible']
                self.angle = (self.angle + p[random.randint(0, len(p) - 1)]) % 8

        self.x += step[self.angle]['x']
        self.y += step[self.angle]['y']


field = [[0] * FIELD_SIZE for i in range(FIELD_SIZE)]


import random

agents = []
for i in range(10):
    x = random.randint(0, 9)
    y = random.randint(0, 9)

    speed = 5
    pheromone_intensity = random.randint(1, 2)
    angle = random.randint(0, 7)

    agents.append(agent(x, y, speed, pheromone_intensity, angle))


def print_field(field):
    for i in field:
        print(*i)

for i in range(1, 100):
    a = input()
    print_field(field)
    for a in agents:
        field[a.x][a.y] -= 1
        a.move(field)
        if a.is_alive:
            # print(a.x, a.y)
            field[a.x][a.y] += a.pheromone_intensity
        else:
            agents.remove(a)

