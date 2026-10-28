#include "pangram.h"
#include <ctype.h>
#include <stddef.h>

bool is_pangram(const char *sentence) {
    if (sentence == NULL) return false;

    bool was_letter_seen[26] = {false};
    int letter_found_counter = 0;
    // initializes all letter seen booleans to false

    for (const char *letter = sentence; *letter; letter++) {
        unsigned char unsigned_letter = (unsigned char) *letter;
        if (isalpha(unsigned_letter)) {
            int letter_index = tolower(unsigned_letter) - 'a';
            /*
            Will check whether a letter was found once or not,
            and 'letter_found_counter' is incremented once for
            every unique letter
            */
            if (!was_letter_seen[letter_index]) {
                was_letter_seen[letter_index] = true;
                letter_found_counter++;
            }
        }
    }

    return letter_found_counter == 26;
}
