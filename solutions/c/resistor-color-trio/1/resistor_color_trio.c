#include "resistor_color_trio.h"

/*
 * Decode a resistor's color bands into a value and unit.
 *
 * resistor_band_colors[0] = first digit,
 * resistor_band_colors[1] = second digit,
 * resistor_band_colors[2] = power-of-ten multiplier.
 * Any extra bands are ignored.
 *
 * Each color's enum value equals its numeric value
 * (BLACK = 0 ... WHITE = 9),
 * so a band can be used directly as a digit.
 */
resistor_value_t color_code(resistor_band_t *resistor_band_colors)
{
    resistor_value_t final_resistance_value = { .value = 0, .unit = OHMS };

    /* Combine the first two bands into a two-digit number (e.g. ORANGE, ORANGE -> 33).
     * Using 64 bits because the largest possible result (99 * 10^9) overflows 32 bits. */
    uint64_t resistance_in_ohms = resistor_band_colors[0] * 10 + resistor_band_colors[1];

    /* The third band is the number of zeros to append, so multiply by 10 that many times. */
    for (resistor_band_t i = 0; i < resistor_band_colors[2]; i++) {
        resistance_in_ohms *= 10;
    }

    /* Scale up to the largest unit that divides the value evenly.
     * The unit enum is ordered OHMS, KILOOHMS, MEGAOHMS, GIGAOHMS, so
     * incrementing it moves to the next unit each time we divide by 1000. */
    while (resistance_in_ohms >= 1000) {
        resistance_in_ohms /= 1000;
        final_resistance_value.unit++;
    }

    /* After scaling, the value is at most 3 digits, so it safely fits in 16 bits. */
    final_resistance_value.value = (uint16_t) resistance_in_ohms;
    return final_resistance_value;
}