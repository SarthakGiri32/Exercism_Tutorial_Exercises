#include "rna_transcription.h"
#include <stdlib.h>
#include <string.h>

char *to_rna(const char *dna) {
    size_t sequence_length = strlen(dna);
    char *rna = malloc(sequence_length + 1); // +1 for the '\0' terminator

    for (size_t i = 0; i < sequence_length; i++) {
        switch(dna[i]) {
            case 'G': rna[i] = 'C'; break;
            case 'C': rna[i] = 'G'; break;
            case 'T': rna[i] = 'A'; break;
            case 'A': rna[i] = 'U'; break;
            default: return '\0';
        }
    }

    rna[sequence_length] = '\0'; // to terminate the string
    return rna;
}
