class ResistorColor {
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

  List<String> get colors => List.unmodifiable(_colors);

  int colorCode(String color) => colors.indexOf(color.toLowerCase());
}
