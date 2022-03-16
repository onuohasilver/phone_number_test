class PhoneNumber {
  String clean(String number) {
    ///Initial Checks before removing all non digit characters using regex
    _hasLetters(number);
    _hasPunctuation(number);

    ///Removing all non digit characters using regex
    String result = number.replaceAll(RegExp(r'[^0-9]+'), '');

    ///Carries out all the checks sequentially
    _isLessThanNine(result);
    _isGreaterThanEleven(result);
    result = _isEqualEleven(result);
    _areaCodeStartsWithZeroOrOne(result);
    _exchangeCodeStartsWithZeroOrOne(result);

    // print(result);
    return result;
  }

  void _isLessThanNine(String result) {
    if (result.length <= 9) {
      throw (FormatException("incorrect number of digits"));
    }
  }

  void _isGreaterThanEleven(String result) {
    if (result.length > 11) {
      throw (FormatException("more than 11 digits"));
    }
  }

  String _isEqualEleven(String result) {
    if (result.length == 11) {
      if (result.startsWith('1')) {
        result = result.replaceFirst(RegExp(r'1'), '');
      } else {
        throw (FormatException("11 digits must start with 1"));
      }
    }
    return result;
  }

  void _hasLetters(String result) {
    if (result.toLowerCase().contains(RegExp(r'[a-z]'))) {
      throw (FormatException('letters not permitted'));
    }
    ;
  }

  void _hasPunctuation(String result) {
    if (result.toLowerCase().contains(new RegExp(r'[!@#$%^&*?":{}|<>]'))) {
      throw (FormatException('punctuations not permitted'));
    }
  }

  void _areaCodeStartsWithZeroOrOne(String result) {
    if (result.startsWith('0'))
      throw (FormatException('area code cannot start with zero'));
    if (result.startsWith('1'))
      throw (FormatException('area code cannot start with one'));
  }

  void _exchangeCodeStartsWithZeroOrOne(String result) {
    if (result.substring(3).startsWith('0')) {
      throw (FormatException('exchange code cannot start with zero'));
    }
    if (result.substring(3).startsWith('1')) {
      throw (FormatException('exchange code cannot start with one'));
    }
  }
}

void main(List<String> args) {
  PhoneNumber().clean('+1 (323) 156-7890');
}
