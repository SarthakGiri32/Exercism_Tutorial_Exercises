class Isogram {
  bool isIsogram(String input) {
    final nonAlpha = RegExp(r'[^a-z]');
    var letterList = input.toLowerCase()
                          .replaceAll(nonAlpha, '') // removing non-alphabets
                          .split('');
    Map<String, int> letterCountMap = {};
    for (final letter in letterList) {
      letterCountMap.update(letter, (count) => count + 1, ifAbsent: () => 1);
      if (letterCountMap[letter]! > 1) return false;    
    }
    return true;
  }
}
