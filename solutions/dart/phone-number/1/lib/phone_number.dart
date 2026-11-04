class PhoneNumber {
  String clean(String rawPhoneNumber) {
    rawPhoneNumber = rawPhoneNumber.trim();
    String cleanPhoneNumber = '';
    var validPhoneNumberRegex = 
      RegExp(
        r'^(\+?1)?(\ )*(\(?[2-9]\d{2}\)?)(\ |-|\.)*(\(?[2-9]\d{2}\)?)(\ |-|\.)*(\(?\d{4}\)?)$');
    // print('validPhoneNumberRegex.hasMatch(rawPhoneNumber): '
    //   '${validPhoneNumberRegex.hasMatch(rawPhoneNumber)}');
    if (validPhoneNumberRegex.hasMatch(rawPhoneNumber)) {
      cleanPhoneNumber = rawPhoneNumber.split('')
                                        .where((c) => RegExp(r'[\d]+').hasMatch(c))
                                        .join();
      if (cleanPhoneNumber[0] == '1') cleanPhoneNumber = cleanPhoneNumber.substring(1);   
    }

    // I) For testing invalid non-digit characters
    // 1. Reject letters
    if (RegExp(r'[A-Za-z]').hasMatch(rawPhoneNumber)) {
      throw FormatException('letters not permitted');
    // 2. Reject invalid punctuations
    } else if (RegExp(r'[^\d\s().+\-]').hasMatch(rawPhoneNumber)) {
      throw FormatException('punctuations not permitted');
    }

    // II) For testing digit specific user errors
    // 1. Normalize to digits only by removing all non-digit characters
    var digits = rawPhoneNumber.replaceAll(RegExp(r'\D'), '');
    
    if (digits.length < 10) throw FormatException('must not be fewer than 10 digits');
    if (digits.length > 11) throw FormatException('must not be greater than 11 digits');
    if (digits.length == 11) {
      if (digits[0] != '1') throw FormatException('11 digits must start with 1');
      digits = digits.substring(1);
    }

    if (digits[0] == '0') throw FormatException('area code cannot start with zero');
    if (digits[0] == '1') throw FormatException('area code cannot start with one');
    if (digits[3] == '0') throw FormatException('exchange code cannot start with zero');
    if (digits[3] == '1') throw FormatException('exchange code cannot start with one');
    return cleanPhoneNumber;
  }
}
