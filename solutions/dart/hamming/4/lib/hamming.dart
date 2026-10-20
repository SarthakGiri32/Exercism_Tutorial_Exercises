class Hamming {
  // My solution
  /* int distance(String dnaStrand1, String dnaStrand2) {
    int hammingDistance = 0;
    if (dnaStrand1.length != dnaStrand2.length) throw ArgumentError('strands must be of equal length');
    for (int i = 0; i < dnaStrand1.length; i++) if (dnaStrand1[i] != dnaStrand2[i]) hammingDistance++;      
    return hammingDistance;
  } */

  /* 
  Hamming distance: count the positions where dnaStrand1 and dnaStrand2 differ.
  Iterable.generate lazily yields the indices 0..dnaStrand1.length-1,
  where() keeps only the indices whose characters don't match,
  and .length counts them. No intermediate list is built.
  The equal-length check guards against RangeError (dnaStrand2 shorter)
  or silently ignored characters (dnaStrand2 longer).
  (and an explicit ArgumentError)
   */
  int distance(String dnaStrand1, String dnaStrand2) =>   
    (dnaStrand1.length != dnaStrand2.length) ? throw ArgumentError('strands must be of equal length') :
      Iterable<int>.generate(dnaStrand1.length).where((i) => dnaStrand1[i] != dnaStrand2[i]).length;
}
