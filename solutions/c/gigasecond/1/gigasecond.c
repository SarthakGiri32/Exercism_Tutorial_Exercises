#include "gigasecond.h"

void gigasecond(time_t input, char *output, size_t size) {
    input += (time_t) 1000000000;
    // break-down the incremented input into a UTC-time-zone struct tm
    struct tm *utc_time_struct = gmtime(&input);
    strftime(output, size, "%Y-%m-%d %H:%M:%S", utc_time_struct);
}
