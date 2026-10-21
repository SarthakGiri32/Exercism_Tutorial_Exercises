class SquareRoot {
  int squareRoot(int target) {
    int upperLimit = target ~/ 2, lowerLimit = 1;
    int squareRootValue = 1;
    while (lowerLimit <= upperLimit) {
      int midPoint = (lowerLimit + upperLimit) ~/ 2;
      int midPointSquared = midPoint * midPoint;
      if (midPointSquared == target) {
        squareRootValue = midPoint;
        break;
      } else if (midPointSquared < target) {
        lowerLimit = midPoint + 1;
      } else {
        upperLimit = midPoint - 1;
      }
    }
    return squareRootValue;
  }
}
