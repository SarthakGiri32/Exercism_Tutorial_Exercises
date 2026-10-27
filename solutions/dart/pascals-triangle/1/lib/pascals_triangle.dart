class PascalsTriangle {
  // My solution 1
  /* List<List<int>> rows(int rowNumber) {
    List<List<int>> pascalTriangleRows = [[1]];
    if (rowNumber == 0) return <List<int>>[];
    for (int i = 1; i < rowNumber; i++) {
      final singlePascalRow = List<int>.filled(pascalTriangleRows[i - 1].length + 1, 1);
      /* 
      only calculating values for the inner elements of a row 
      (the outer edges are always 1)
      */
      for (int j = 1; j < pascalTriangleRows[i - 1].length; j++) {
        singlePascalRow[j] = pascalTriangleRows[i - 1][j - 1] + pascalTriangleRows[i - 1][j];
      }
      pascalTriangleRows.add(singlePascalRow);
    }
    return pascalTriangleRows;
  } */

  // My solution 2
  List<List<int>> rows(int rowNumber) {
    final triangle = <List<int>>[];
    for (int i = 0; i < rowNumber; i++) {
      /* 
      only calculating values for the inner elements of a row 
      (the outer edges are always 1)
      */
      triangle.add(List.generate(i + 1, (j) =>
        j == 0 || j == i ? 1 : triangle[i - 1][j - 1] + triangle[i - 1][j]));
    }
    return triangle;
  }
}
