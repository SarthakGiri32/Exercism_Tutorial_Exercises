// define the Classification enum
enum Classification {
  perfect,
  abundant,
  deficient
}

class PerfectNumbers {
  Classification classify(int number) {
    if (number <= 0) throw ArgumentError();
    return switch(_getFactorSum(number).compareTo(number)) {
      0 => Classification.perfect,
      > 0 => Classification.abundant,
      _ => Classification.deficient
    };
  }

  int _getFactorSum(int number) {
    int factorSum = 0;
    /* 
    Looping to n ~/ 2 is safe because no proper divisor of n can exceed half of it.
    That also halves the work compared to looping to n - 1.
    */
    for (int i = 1; i <= number ~/ 2; i++) {
      if (number % i == 0) factorSum += i;
    }
    return factorSum;
  }
}
