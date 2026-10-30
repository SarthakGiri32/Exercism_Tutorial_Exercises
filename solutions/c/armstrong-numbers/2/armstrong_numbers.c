#include "armstrong_numbers.h"
#include <math.h>

bool is_armstrong_number(int candidate) {
    if (candidate < 9) return true;
    
    int number_of_digits = log10(candidate) + 1;

    int armstrong_sum = 0;
    int temp = candidate;
    while (temp > 0) {
        int digit = temp % 10;
        int digit_power = 1;
        for (int i = 1;
            i <= number_of_digits;
            i++) digit_power *= digit;
        armstrong_sum += digit_power;
        temp /= 10;
    }
    
    return armstrong_sum == candidate;
}
