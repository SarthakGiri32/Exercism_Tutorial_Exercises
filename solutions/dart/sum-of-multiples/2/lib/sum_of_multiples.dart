class SumOfMultiples {
  // My Solution
  /* int sum(List<int> magicalItemBaseValues, int levelCompleted) {
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
  } */

  // Using Lambda notation (creating and 'folding' a set literal of unique base value multiples)
  int sum(List<int> magicalItemBaseValues, int levelCompleted) => {
    // filtering for magical item base values equal to 0
    for (final magicalItemBaseValue in magicalItemBaseValues.where((baseValue) => baseValue > 0))
      /* 
      1. Filtering for any magical item base value greater than the level completed
      2. Calculating multiples tables for each base value till less than the level completed
      3. Storing the values in a set literal negates the necessity of creating extra Lists to
      separately store the base value multiples tables
       */
      for (var baseMultiple = magicalItemBaseValue;
          baseMultiple < levelCompleted;
          baseMultiple += magicalItemBaseValue)
        baseMultiple,
  }.fold(0, (totalEnergyPointsAwarded, baseMultiple) => totalEnergyPointsAwarded + baseMultiple);
}
