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
    double.parse((seconds / _earthAgeSeconds / _planetsYearFactorMap[planet]!).toStringAsFixed(2));
}
