class Darts {
  int score(double x, double y) {
    double hitPoint = x * x + y * y;
    if (hitPoint > 100.0) return 0;
    else if (hitPoint > 25.0 && hitPoint <= 100.0) return 1;
    else if (hitPoint > 1.0 && hitPoint <= 25.0) return 5;
    else return 10;
  }
}
