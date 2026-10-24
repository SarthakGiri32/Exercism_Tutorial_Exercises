#include "hamming.h"
#include "stddef.h"

int compute(const char *lhs, const char *rhs) {
    if (lhs == NULL || rhs == NULL) {
        return -1;
    }

    int hamming_distance = 0;
    while (*lhs != '\0' && *rhs != '\0') {
        if (*lhs != *rhs) {
            hamming_distance++;
        }
        lhs++;
        rhs++;
    }

    // If one string still has characters left, lengths differed
    if (*lhs != '\0' || *rhs != '\0') {
        return -1;
    }

    return hamming_distance;
}
