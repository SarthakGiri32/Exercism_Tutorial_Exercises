class ResistorColorDuo {
  List<String> _colors = [
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

  int value(List<String> color_bands) => 
    _colors.indexOf(color_bands[0]) * 10 + _colors.indexOf(color_bands[1]);
}
