class RnaTranscription {
  static const _dnaToRnaTranscriptionTable = <String, String>{
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U'
  };

  // My Solution 1
  /* String toRna(String dnaToTranscribe) {
    final transcribedRna = StringBuffer();
    for (int i = 0; i < dnaToTranscribe.length; i++) {
      transcribedRna.write(_dnaToRnaTranscriptionTable[dnaToTranscribe[i]]);
    }
    return transcribedRna.toString();
  } */

  // My Solution 2
  String toRna(String dnaToTranscribe) =>
    dnaToTranscribe.split('').map((nucleotide) => _dnaToRnaTranscriptionTable[nucleotide]!).join('');
}
