import 'dart:math';

class SpaceAge {
  static Map<String, double> _planetsYearFactorMap = {
    "Mercury": 0.2408467,
    "Venus": 0.61519726,
    "Earth": 1.0,
    "Mars": 1.8808158,
    "Jupiter": 11.862615,
    "Saturn": 29.447498,
    "Uranus":	84.016846,
    "Neptune":164.79132
  };

  static int get _earthAgeSeconds => 31557600;

  /* 
  Following PEMDAS, the order of execution for division will be from left to right:
  1. 'seconds / _earthAgeSeconds' will be done first
  2. the result of step 2 will be divided by '_planetsYearFactorMap[planet]!'
  */
  double age({required String planet, required int seconds}) =>
    _round((seconds / _earthAgeSeconds / _planetsYearFactorMap[planet]!), 2);

  static _round(double originalValue, int afterDecimalPointPlaces) {
    // convert the places to preserve into an order of magnitude (for e.g.: for 3 places, we would get 1000)
    int roundToAfterDecimalPointPlaces = pow(10, afterDecimalPointPlaces) as int;
    /* 
    if 3 places have to be preserved:
    1. 3.14159 * 1000 = 3141.59 (originalValue * roundToAfterDecimalPointPlaces)
    2. 3141.59.round() = 3142 ((originalValue * roundToAfterDecimalPointPlaces).round())
    3. 3142 / 1000 = 3.142 ((originalValue * roundToAfterDecimalPointPlaces).round() / roundToAfterDecimalPointPlaces)
    */
    return (originalValue * roundToAfterDecimalPointPlaces).round() / roundToAfterDecimalPointPlaces;
  }
}
