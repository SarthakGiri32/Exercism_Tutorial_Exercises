import 'dart:math';

class ResistorColorTrio {
  static const _colors = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white'
  ];

  static const _metricPrefixList = [
    'ohms',
    'kiloohms',
    'megaohms',
    'gigaohms'
  ];

  String label(List<String> colorCodes) {
    int resistanceInOhms = 
      _colors.indexOf(colorCodes[0]) * 10 + _colors.indexOf(colorCodes[1]);
    resistanceInOhms *= pow(10, _colors.indexOf(colorCodes[2])).toInt();

    int metricPrefix = 0;
    while (resistanceInOhms >= 1000 && resistanceInOhms % 1000 == 0) {
      resistanceInOhms ~/= 1000;
      metricPrefix++;
    }

    return '$resistanceInOhms ${_metricPrefixList[metricPrefix]}';
  }
}
