#include "isogram.h"
#include <ctype.h>
#include <stddef.h>
#include <string.h>

bool is_isogram(const char phrase[]) {
    if (phrase == NULL) return false;

    int letter_count[26] = { 0 };

    for (int i = 0; phrase[i] != '\0'; i++) {
        unsigned char letter = (unsigned char) phrase[i];
        if (isalpha(letter)) {
            // to get a zero-based letter index of 0 to 25
            int letter_index = tolower(letter) - 'a';
            /* ++letter_count[letter_index] is a pre-increment: 
            it adds 1 to letter_count[letter_index] first, 
            then the expression evaluates to the new value */
            if (++letter_count[letter_index] > 1) return false;
        }
    }
    return true;
}
