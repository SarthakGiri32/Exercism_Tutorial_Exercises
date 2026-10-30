#include "armstrong_numbers.h"

static long long integer_pow(int number, int power) {
    long long number_raised_to_exponent = 1;
    while (power > 0) {
        number_raised_to_exponent *= number;
        power--;
    }
    return number_raised_to_exponent;
}

bool is_armstrong_number(int candidate) {
    if (candidate < 0) return false;
    int temp = candidate, number_of_digits = 0;
    long long armstrong_sum = 0;
    while (temp > 0)
    {
        temp /= 10;
        number_of_digits++;
    }
    temp = candidate;
    while (temp > 0) {
        armstrong_sum += integer_pow(temp % 10, number_of_digits);
        temp /= 10;
    }
    return armstrong_sum == candidate;
}
