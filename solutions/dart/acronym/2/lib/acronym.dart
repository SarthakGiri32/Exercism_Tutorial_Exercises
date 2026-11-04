class Acronym {
  // My Solution 1
  String abbreviate(String longLengthTerm) {
    final abbreviation = StringBuffer();
    final wordsList = longLengthTerm.split(RegExp(r"[^A-Za-z']+"))
                                    .where((word) => word.isNotEmpty)
                                    .toList();
    for (final word in wordsList) abbreviation.write(word[0].toUpperCase());
    return abbreviation.toString();
  }

  // My Solution 2
  // String abbreviate(String phrase) =>
  //   // treating anything that isn’t a letter or apostrophe as a separator
  //   phrase.split(RegExp(r"[^A-Za-z']+"))
  //         // filter out empty strings caused by leading and trailing separators
  //         .where((word) => word.isNotEmpty)
  //         // returns the capitalized 1st letter for each word in phrase
  //         .map((word) => word[0].toUpperCase()) 
  //         .join();
}
