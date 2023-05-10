///
/// Utilities Class for parsing num values
///
class StringParser {
  /// A function to parse dynamic [value] to String.
  /// And for [fallbackValue] is mandatory because when there is an error
  /// in parse it will return the value of [fallbackValue].
  ///
  /// [ignoreEmpty] is a flag to ignore empty values, and when [value] is empty
  /// and [ignoreEmpty] is true, it will return [fallbackValue]
  static String parse(
    dynamic value, {
    String fallbackValue = '',
    bool ignoreEmpty = true,
  }) {
    final resultParse = tryParse(value);

    return ((resultParse?.isEmpty ?? false) && !ignoreEmpty)
        ? fallbackValue
        : resultParse ?? fallbackValue;
  }

  /// Parse [value] as a, possibly signed, String literal.
  ///
  /// Like [parse] except that this function returns `null` where a
  /// similar call to [parse] for invalid input [value].
  static String? tryParse(dynamic value) {
    if (value is String) {
      return value;
    } else if (value != null) {
      return value.toString();
    }

    return null;
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }
}
