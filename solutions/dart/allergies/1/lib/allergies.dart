class Allergies {
  static const _allergyScoreMap = {
    'eggs': 1,
    'peanuts': 2,
    'shellfish': 4,
    'strawberries': 8,
    'tomatoes': 16,
    'chocolate': 32,
    'pollen': 64,
    'cats': 128
  };

  bool allergicTo(String allergyType, int allergyScore) {
    if (allergyScore < _allergyScoreMap[allergyType]!) return false;
    List<String> allergyScoreInBinary =
      getBinaryRepAndAllergyMapKeys(allergyScore)[0];
    var allergyMapKeys = getBinaryRepAndAllergyMapKeys(allergyScore)[1];
    for (int i = 0; i < allergyScoreInBinary.length; i++) {
      if (allergyScoreInBinary[i] == '1') {
        if (allergyMapKeys[i] == allergyType) return true;
      }
    }
    return false;
  }

  List<String> list(int allergyScore) {
    if (allergyScore < 1) return <String>[];
    if (allergyScore > 256) {
      while (allergyScore > 256) allergyScore -= 256;
    }
    List<String> allergyScoreInBinary =
      getBinaryRepAndAllergyMapKeys(allergyScore)[0];
    var allergyMapKeys = getBinaryRepAndAllergyMapKeys(allergyScore)[1];
    var matchedAllergyTypes = <String>[];
    for (int i = 0; i < allergyScoreInBinary.length; i++) {
      if (allergyScoreInBinary[i] == '1') {
        matchedAllergyTypes.add(allergyMapKeys[i]);
      }
    }
    return matchedAllergyTypes;
  }

  List<List<String>> getBinaryRepAndAllergyMapKeys(int allergyScore) {
    List<String> allergyScoreInBinary = allergyScore.toRadixString(2)
                                                      .split('')
                                                      .reversed
                                                      .toList();
    var allergyMapKeys = _allergyScoreMap.keys.toList();
    return [allergyScoreInBinary, allergyMapKeys];
  }
}
