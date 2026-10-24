#include "space_age.h"
#include <math.h>

static float round_to_decimal_precision(double years, int decimal_places) {
    double round_to_decimal_factor = pow(10.0, decimal_places);
    return round(years * round_to_decimal_factor) / round_to_decimal_factor;
}

float age(planet_t planet, int64_t seconds) {
    const int64_t single_earth_year_in_seconds = 31557600;
    double age_in_earth_years = (double) seconds / single_earth_year_in_seconds;
    double planet_age_factor;

    switch (planet)
    {
        case MERCURY: planet_age_factor = 0.2408467; break;
        case VENUS: planet_age_factor = 0.61519726; break;
        case EARTH: planet_age_factor = 1.0; break;
        case MARS: planet_age_factor = 1.8808158; break;
        case JUPITER: planet_age_factor = 11.862615; break;
        case SATURN: planet_age_factor = 29.447498; break;
        case URANUS: planet_age_factor = 84.016846; break;
        case NEPTUNE: planet_age_factor = 164.79132; break;
        default: return -1;
    }
    return (float) round_to_decimal_precision(age_in_earth_years / planet_age_factor, 2);
}
