class BottleSong {
  static const _bottleCountList = [
    'no', 'one', 'two', 'three', 'four',
    'five', 'six', 'seven', 'eight', 'nine', 'ten'
  ];

  String _bottlePlurality(int verseIndexReversed) =>
    verseIndexReversed == 1 ? 'bottle' : 'bottles';
  
  String _bottleCountCapitalized(String bottleCount) =>
    bottleCount[0].toUpperCase() + bottleCount.substring(1);
  
  List<String> _getVerse(int verseIndexReversed) {
    final currentVerse =
      '${_bottleCountCapitalized(_bottleCountList[verseIndexReversed])} green '
      '${_bottlePlurality(verseIndexReversed)} hanging on the wall,';
    
    return [
      currentVerse,
      currentVerse,
      'And if one green bottle should accidentally fall,',
      "There'll be ${_bottleCountList[verseIndexReversed - 1]} green " +
        "${_bottlePlurality(verseIndexReversed - 1)} hanging on the wall."
    ];
  }

  List<String> recite(int startVerse, int verseCount) {
    final selectedLines = <String>[];
    for (int i = startVerse; i > startVerse - verseCount; i--) {
      if (i != startVerse) selectedLines.add('');
      selectedLines.addAll(_getVerse(i));
    }
    return selectedLines;
  }
}
