import 'package:formz/formz.dart';

enum MinLengthValidationError {
  /// Generic invalid error.
  invalid
}

/// A min length string validator that can be used to validate a [T].
class MinLengthFormz extends FormzInput<String?, MinLengthValidationError> {
  const MinLengthFormz.pure(this.length) : super.pure(null);
  const MinLengthFormz.dirty(String? value, this.length) : super.dirty(value);

  final int length;

  @override
  MinLengthValidationError? validator(String? value) =>
      value != null && value.length >= length
          ? null
          : MinLengthValidationError.invalid;
}

extension MinLengthFormzX on MinLengthFormz {
  /// Method to change or revalidate value
  MinLengthFormz dirty(String? value) {
    return MinLengthFormz.dirty(value, length);
  }
}
