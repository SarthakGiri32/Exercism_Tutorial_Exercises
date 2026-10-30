#include "robot_simulator.h"

robot_status_t robot_create(robot_direction_t direction, int x, int y)
{
    robot_status_t init_robot_status = {.direction = direction,
                                        .position = {x, y}};
    return init_robot_status;
}

// Since the enum is ordered clockwise, modular arithmetic is used
static void turn_right(robot_status_t *robot) {
    robot->direction = (robot->direction + 1) % DIRECTION_MAX;
}

// The '+ (DIRECTION_MAX - 1)' avoids modulo on a negative direction value
// + 3 is equivalent to single decrement for counter-clockwise direction change
static void turn_left(robot_status_t *robot) {
    robot->direction = (robot->direction + (DIRECTION_MAX - 1)) % DIRECTION_MAX;
}

static void advance(robot_status_t *robot) {
    switch (robot->direction)
    {
    case DIRECTION_NORTH: robot->position.y++; break;
    case DIRECTION_EAST: robot->position.x++; break;
    case DIRECTION_SOUTH: robot->position.y--; break;
    case DIRECTION_WEST: robot->position.x--; break;
    default:
        return;
    }
}

void robot_move(robot_status_t *robot, const char *commands) {
    if (!robot || !commands) return;
    for (const char *command = commands; *command; command++) {
        switch (*command)
        {
            case 'R': turn_right(robot); break;
            case 'L': turn_left(robot); break;
            case 'A': advance(robot);
        }
    }
}
