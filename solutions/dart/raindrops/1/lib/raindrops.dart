class Raindrops {
  static Map<int, String> _raindropSoundsMap = {
    3: 'Pling',
    5: 'Plang',
    7: 'Plong'
  };

  String convert(int numberToConvert) {
    StringBuffer raindropSound = StringBuffer();

    [3, 5, 7].forEach((possibleFactor) => 
      raindropSound.write((numberToConvert % possibleFactor == 0) ? _raindropSoundsMap[possibleFactor] : ''));
    if (raindropSound.isEmpty) raindropSound.write(numberToConvert.toString());

    return raindropSound.toString();
  }
}
