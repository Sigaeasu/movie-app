/// Class utilities for handling validators text in String
///
/// **Features**:
/// - Get regex
/// - Check is valid text or not
///
class Validators {
  // Regexs Validators

  /// Email Validation Regex
  static final RegExp emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  /// Phone Number Validation Regex
  static final RegExp phoneRegExp = RegExp(
    r'(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{6,14}$',
  );

  // Main function validation text

  /// Method to check email text is valid or not
  ///
  /// When valid is email address then return `true`
  /// Otherwise return `false`
  static bool isValidEmail(String data) {
    return emailRegExp.hasMatch(data);
  }

  /// Method to check phone text is valid or not
  ///
  /// When valid is phone number then return `true`
  /// Otherwise return `false`
  static bool isValidPhone(String data) {
    final parse = int.tryParse(data);
    if (parse != null && parse.toString().length >= 8) return true;

    return false;
  }

  /// Method to cek is valid text with minimum length
  ///
  /// Text when
  ///
  /// Params [trim] can trim text, this method simillar in String `.trim()`
  ///
  /// When valid is text meet the rules with minimum length then return `true`
  /// Otherwise return `false`
  static bool isValidWithMinimumLength(
    String data,
    int minimumLength, {
    bool trim = true,
  }) {
    return (trim ? data.trim() : data).length >= minimumLength;
  }

  /// Method to check double validation is valid or not
  /// [value] is nullable double value
  ///
  /// - [minNumAfterComma] check [value] valid minimum number after comma
  /// - [maxNumAfterComma] check [value] valid maximum number after comma
  static bool isValidDecimalNumber(
    double? value, {
    int? maxNumAfterComma,
    int? minNumAfterComma,
  }) {
    if (value == null) return false;
    final comma = value.toString().split('.').last;
    if (maxNumAfterComma != null && comma.length > maxNumAfterComma) {
      return false;
    }
    if (minNumAfterComma != null && comma.length < minNumAfterComma) {
      return false;
    }

    return true;
  }

  /// Method to check [double] validation from [String] is valid or not
  /// [value] is nullable double value
  ///
  /// - [minNumAfterComma] check [value] valid minimum number after comma
  /// - [maxNumAfterComma] check [value] valid maximum number after comma
  /// - [validOnEmpty] check [value] valid when is empty return true
  static bool isValidDecimalNumberFromString(
    String value, {
    int? maxNumAfterComma,
    int? minNumAfterComma,
    bool validOnEmpty = false,
  }) {
    if (validOnEmpty && value.trim().isEmpty) return true;

    return isValidDecimalNumber(
      double.tryParse(value),
      minNumAfterComma: minNumAfterComma,
      maxNumAfterComma: maxNumAfterComma,
    );
  }

  /// Method to check integer validation is valid or not
  /// [value] is nullable integer value
  ///
  /// - [minNum] check [value] valid minimum number
  /// - [maxNum] check [value] valid maximum number
  static bool isValidIntegerNumberFromString(
    String value, {
    int? maxNum,
    int? minNum,
    bool validOnEmpty = false,
  }) {
    if (value.trim().isEmpty && validOnEmpty) return true;

    final parse = int.tryParse(value);
    if (parse == null) return false;
    if (maxNum != null && parse > maxNum) return false;
    if (minNum != null && parse < minNum) return false;

    return true;
  }
}
