class CollatzConjecture {
  int steps(int number) {
    if (number <= 0) throw ArgumentError('Only positive integers are allowed');
    int collatz_conjecture_steps = 0;
    while (number > 1) {
      number = number % 2 == 0 ? number ~/ 2 : number * 3 + 1;
      collatz_conjecture_steps++;
    }
    return collatz_conjecture_steps;
  }
}
