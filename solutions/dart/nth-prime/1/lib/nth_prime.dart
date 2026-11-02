class NthPrime {
  int prime(int n) {
    if (n < 1) {
      throw ArgumentError('There is no zeroth prime');
    }
    
    int i = 1, finalPrimeNumber = 1;
    while (i <= n) {
      finalPrimeNumber++;
      if (_isPrime(finalPrimeNumber)) i++;
    }
    return finalPrimeNumber;
  }

  bool _isPrime(int n) {
    if (n < 2) return false;
    if (n < 4) return true; // 2 or 3
    if (n % 2 == 0 || n % 3 == 0) return false;
    
    /*
    1. i = 5 (already ruled out 2 and 3)
    2. Tests two candidates per loop: i and i + 2:
    If either divides n evenly, n has a factor
    other than 1 and itself, so it’s not prime.
    3. Moves i forward by 6. This is the key trick:
    Every prime above 3 has the form 6k − 1 or 6k + 1
    (like 5 and 7, 11 and 13, 17 and 19) (k >= 1).
    So the loop checks 5 and 7, then 11 and 13,
    then 17 and 19, and so on, skipping all the
    numbers that are multiples of 2 or 3. */
    for (int i = 5; i * i <= n; i += 6) {
      if (n % i == 0 || n % (i + 2) == 0) return false;
    }
    return true;
  }
}

/* 
Walkthrough with n = 35 (not prime)

1. 35 is not below 2 or 4.
2. 35 % 2 = 1 and 35 % 3 = 2, so it passes that check.
3. i = 5: is 25 <= 35? Yes. Check 35 % 5 = 0,
so return False.

Walkthrough with n = 29 (is prime)

1. Passes the early checks (29 % 2 = 1, 29 % 3 = 2).
2. i = 5: 25 <= 29, so enter the loop. 29 % 5 = 4
and 29 % 7 = 1, so no factor found. i becomes 11.
3. i = 11: 121 <= 29 is false, so the loop ends.
4. Return True.
 */
