import 'package:formz/formz.dart';

enum NotNullValidationError {
  /// Generic invalid error.
  invalid
}

/// A not null validator that can be used to validate a [T].
class NotNullFormz<T> extends FormzInput<T?, NotNullValidationError> {
  const NotNullFormz.pure() : super.pure(null);
  const NotNullFormz.dirty(T? value) : super.dirty(value);

  @override
  NotNullValidationError? validator(T? value) =>
      value != null ? null : NotNullValidationError.invalid;
}

extension NotNullFormzX<T> on NotNullFormz<T> {
  /// Method to change or revalidate value
  NotNullFormz<T> dirty(T? value) {
    return NotNullFormz<T>.dirty(value);
  }
}
