class Strain {
  List<T> keep<T>(List<T> values, bool Function(T) fn) {
    List<T> keepList = [];
    for (final value in values) if (fn(value)) keepList.add(value);
    return keepList;
  }

  List<T> discard<T>(List<T> values, bool Function(T) fn) {
    List<T> discardList = [];
    for (final value in values) if (!fn(value)) discardList.add(value);
    return discardList;
  }
}
