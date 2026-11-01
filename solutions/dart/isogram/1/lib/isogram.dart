class Isogram {
  bool isIsogram(String input) {
    var letterList = input.toLowerCase().split('');
    // single character should be an alphabet
    final alphabetsOnly = RegExp(r'^[a-z]$'); 
    Map<String, int> letterCountMap = {};
    for (final letter in letterList) {
      if (alphabetsOnly.hasMatch(letter)) {
        letterCountMap.update(letter, (count) => count + 1, ifAbsent: () => 1);
        if (letterCountMap[letter]! > 1) return false;
      }      
    }
    return true;
  }
}
