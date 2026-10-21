class Strain {
  List<T> keep<T>(List<T> values, bool Function(T) fn) {
    List<T> keepList = [];
    for (int i = 0; i < values.length; i++) if (fn(values[i])) keepList.add(values[i]);
    return keepList;
  }

  List<T> discard<T>(List<T> values, bool Function(T) fn) {
    List<T> discardList = [];
    for (int i = 0; i < values.length; i++) if (!fn(values[i])) discardList.add(values[i]);
    return discardList;
  }
}
