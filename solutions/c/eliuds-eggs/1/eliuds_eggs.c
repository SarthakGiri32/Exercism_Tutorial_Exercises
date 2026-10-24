#include "eliuds_eggs.h"

unsigned int egg_count(unsigned int egg_count_decimal) {
    unsigned int egg_counter = 0;

    do {
        egg_counter += egg_count_decimal % 2;
        egg_count_decimal /= 2;
    } while (egg_count_decimal > 0);

    return egg_counter;
}
