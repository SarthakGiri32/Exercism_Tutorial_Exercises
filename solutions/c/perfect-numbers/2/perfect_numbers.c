#include "perfect_numbers.h"

kind classify_number(int number) {
    if (number <= 0) return ERROR;

    int sum_of_factors = 0;
    for (int i = 1; i <= number / 2; i++) 
        if (number % i == 0) sum_of_factors += i;

    return sum_of_factors < number ? DEFICIENT_NUMBER :
        sum_of_factors > number ? ABUNDANT_NUMBER : PERFECT_NUMBER;
}
