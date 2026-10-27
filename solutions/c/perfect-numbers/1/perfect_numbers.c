#include "perfect_numbers.h"

static int get_factor_sum(int number) {
    int sum_of_factors = 0;
    for (int i = 1; i <= number / 2; i++) 
        if (number % i == 0) sum_of_factors += i;
    return sum_of_factors;
}

kind classify_number(int number) {
    if (number <= 0) return ERROR;
    int sum_of_factors = get_factor_sum(number);
    if (number < sum_of_factors) return ABUNDANT_NUMBER;
    else if (number > sum_of_factors) return DEFICIENT_NUMBER;
    else return PERFECT_NUMBER;
}
