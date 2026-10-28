#include "high_scores.h"

int32_t latest(const int32_t *scores, size_t scores_len) {
    return scores[scores_len - 1];
}

int32_t personal_best(const int32_t *scores, size_t scores_len) {
    int32_t max_score = scores[0];
    for (size_t i = 1; i < scores_len; i++) {
        if (max_score < scores[i]) {
            max_score = scores[i];
        }
    }
    return max_score;
}

/* 
1. Each score is compared against the current first, second and third place, 
and the lower places shift down when a new one slots in.
2. Duplicates are kept.
3. The function returns how many scores were actually written, 
which is fewer than 3 if the list is short. Unused slots are left as 0.
*/
size_t personal_top_three(const int32_t *scores, size_t scores_len,
                          int32_t *output)
{
    output[0] = output[1] = output[2] = 0;

    for (size_t i = 0; i < scores_len; i++) {
        int32_t s = scores[i];
        if (s > output[0]) {
            output[2] = output[1];
            output[1] = output[0];
            output[0] = s;
        } else if (s > output[1]) {
            output[2] = output[1];
            output[1] = s;
        } else if (s > output[2]) {
            output[2] = s;
        }
    }

    return scores_len < 3 ? scores_len : 3;
}
