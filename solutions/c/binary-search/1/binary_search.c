#include "binary_search.h"
#include <stdio.h>

const int *binary_search(int value, const int *arr, size_t length)
{
    // search arr[lower_limit .. upper_limit-1]
    size_t lower_limit = 0, upper_limit = length;

    /* 
    1. The length == 0 case needs no special handling:
    lower_limit < upper_limit is 0 < 0, false, so it returns NULL immediately
    (and arr is never touched).
    2. Because upper_limit is exclusive, the loop condition stays < and
    the invariant is simple: the target, if present, is in arr[lower_limit]
    through arr[upper_limit - 1].
    */
    while (lower_limit < upper_limit) 
    {
        size_t mid = (lower_limit + upper_limit) / 2;
        if (arr[mid] == value) {
            return &arr[mid];
        } else if (arr[mid] > value) {
            /* exclude mid; no subtraction, no underflow;
            (due to size_t being 'typedef unsigned long size_t');
            upper_limit = -1 underflows to SIZE_MAX (max value for size_t) */
            upper_limit = mid;
        } else if (arr[mid] < value){
            lower_limit = mid + 1;
        }
    }
    return NULL;
}
