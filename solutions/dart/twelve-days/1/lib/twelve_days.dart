/// Generates the lyrics of "The Twelve Days of Christmas" Christmas carol.
class TwelveDays {
  /// Ordinal words, indexed by day - 1 (index 0 is the first day).
  static const _christmasDayCountInWords = [
    'first', 'second', 'third', 'fourth', 'fifth', 'sixth',
    'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth'
  ];

  /// Gifts in the order they are first received, so index 0 is the gift
  /// from day 1. Stored without trailing punctuation so they can be joined
  /// with commas and given a single period at the end of the verse.
  static const _giftsList = [
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ];

  /// Builds the verse for a single day (1-based, 1 to 12).
  String _getAVerse(int christmasDay) {
    /* 
    Take the gifts received up to this day and reverse them, because the
    song lists the newest gift first and ends with the Partridge.
    toList() makes the reversed iterable a modifiable list.
    */
    final selectedGiftsList = _giftsList.sublist(0, christmasDay).reversed.toList();

    /*
    From day 2 onward, the last item (always the Partridge after reversing)
    is prefixed with "and". Day 1 has a single gift, so no "and".
    */
    if (christmasDay > 1) {
      selectedGiftsList[selectedGiftsList.length - 1] = 'and ${selectedGiftsList.last}';
    }

    /*
    Adjacent string literals are concatenated. The gifts
    are comma-separated, and the final period is added once here.
    */
    return 'On the ${_christmasDayCountInWords[christmasDay - 1]} day of Christmas '
      'my true love gave to me: ${selectedGiftsList.join(', ')}.';
  }

  /// Returns the verses from [startDay] to [endDay] (both inclusive, 1-based),
  /// separated by a line break.
  String recite(int startDay, int endDay) =>
    // Collection-for builds a list with one verse per day in the day-range.
    [for (var christmasDay = startDay; christmasDay <= endDay; christmasDay++)
      _getAVerse(christmasDay)].join('\n');
}