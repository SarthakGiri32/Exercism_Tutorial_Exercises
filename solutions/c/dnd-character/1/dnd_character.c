#include "dnd_character.h"
#include <stdlib.h>
#include <time.h>

int ability(void) {
    int min = 6, ability_value = 0;

    for (int i = 0; i < 4; i++) {
        int dice_roll = rand() % 6 + 1;
        if (min > dice_roll) min = dice_roll;
        ability_value += dice_roll;
    }

    return ability_value - min;
}

int modifier(int score) {
    int subtract_10 = score - 10;
    return (subtract_10 >= 0) ? subtract_10 / 2 : (subtract_10 - 1) / 2;
}

dnd_character_t make_dnd_character(void) {
    // all six abilities in one character share a single seeding for random
    srand((unsigned int) time(NULL));
    dnd_character_t new_dnd_character;
    new_dnd_character.strength = ability();
    new_dnd_character.dexterity = ability();
    new_dnd_character.constitution = ability();
    new_dnd_character.intelligence = ability();
    new_dnd_character.wisdom = ability();
    new_dnd_character.charisma = ability();
    new_dnd_character.hitpoints = 10 + modifier(new_dnd_character.constitution);
    return new_dnd_character;
}
