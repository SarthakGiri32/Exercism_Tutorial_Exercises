class SumOfMultiples {
  int sum(List<int> magicalItemBaseValues, int levelCompleted) {
    if (magicalItemBaseValues.isEmpty ||
        magicalItemBaseValues.every((baseValue) => baseValue > levelCompleted)) return 0;
    List<List<int>> baseValuesMultiplesList = [];
    magicalItemBaseValues.forEach((baseValue) {
      if (baseValue > 0) {
        List<int> singleBaseValueMultiples = []; int multiple = baseValue, i = 2;
        while (multiple < levelCompleted) {
          singleBaseValueMultiples.add(multiple);
          multiple = baseValue * i;
          i++;
        }
        baseValuesMultiplesList.add(singleBaseValueMultiples);
      } 
    });
    // print(baseValuesMultiplesList);
    Set<int> uniqueBaseValueMultiples = baseValuesMultiplesList.expand(
      (baseValueMultiples) => baseValueMultiples).toSet();
    // print(uniqueBaseValueMultiples);
    return baseValuesMultiplesList.isNotEmpty ? uniqueBaseValueMultiples.reduce(
      (baseValueMultiple1, baseValueMultiple2) => baseValueMultiple1 + baseValueMultiple2) : 0;
  }
}
