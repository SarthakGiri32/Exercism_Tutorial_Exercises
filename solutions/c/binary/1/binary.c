#include "binary.h"

/* 
Each time you see a new digit, everything accumulated so far
shifts one place left (which means ×2), and the new digit goes
into the ones place
*/
int convert(const char *input) {
    int decimal_value = 0;
    for (int i = 0; input[i] != '\0'; i++) {
        if (input[i] != '0' && input[i] != '1') return INVALID;
        decimal_value = decimal_value * 2 + (input[i] - '0');
        // input[i] - '0' turns the character '0' or '1' into the integer 0 or 1.
    }
    return decimal_value;
}
