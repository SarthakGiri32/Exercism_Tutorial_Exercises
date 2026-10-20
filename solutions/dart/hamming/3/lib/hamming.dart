class Hamming {
  int distance(String dnaStrand1, String dnaStrand2) {
    int hammingDistance = 0;
    if (dnaStrand1.length != dnaStrand2.length) throw ArgumentError('strands must be of equal length');
    for (int i = 0; i < dnaStrand1.length; i++) if (dnaStrand1[i] != dnaStrand2[i]) hammingDistance++;      
    return hammingDistance;
  }
}
