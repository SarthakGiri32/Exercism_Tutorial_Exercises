class Pangram {
  bool isPangram(String fontExample) => 
    fontExample.toLowerCase()
              .replaceAll(RegExp(r'[^a-z]'), '') // only lowercase letters
              .split('')
              .toSet() // removes duplicates
              .length == 26;
}
