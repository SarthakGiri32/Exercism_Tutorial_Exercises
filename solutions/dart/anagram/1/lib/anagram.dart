class Anagram {
  List<String> findAnagrams(String target, List<String> candidates) {
    final lowerCaseTarget = target.toLowerCase();
    final targetLetterCountMap = _getLetterCountMap(lowerCaseTarget);
    
    return candidates.where((candidate) {
      final lowerCaseCandidate = candidate.toLowerCase();
      return lowerCaseCandidate != lowerCaseTarget &&
        _ifTwoWordsAreAnagrams(_getLetterCountMap(lowerCaseCandidate), targetLetterCountMap);
    }).toList();
  }

  Map<String, int> _getLetterCountMap(String word) {
    final letterCountMap = <String, int>{};
    for (final letter in word.split('')) {
      letterCountMap[letter] = (letterCountMap[letter] ?? 0) + 1;
    }
    return letterCountMap;
  }

  bool _ifTwoWordsAreAnagrams(Map<String, int> letterCountMap1, Map<String, int> letterCountMap2) =>
    letterCountMap1.length == letterCountMap2.length && 
    letterCountMap1.entries.every((letterCountEntry) =>
                                  letterCountMap2[letterCountEntry.key] == letterCountEntry.value);
  
}
