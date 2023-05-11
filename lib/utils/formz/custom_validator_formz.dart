import 'package:formz/formz.dart';

enum CustomValidatorError {
  /// Generic invalid error.
  invalid
}

typedef CustomValidatorParams<T> = bool Function(T? value);

/// A custom validator that can be used to validate a [T].
class CustomValidatorFormz<T> extends FormzInput<T?, CustomValidatorError> {
  CustomValidatorFormz.pure(this.onValidateError) : super.pure(null);
  const CustomValidatorFormz.dirty(T? value, this.onValidateError)
      : super.dirty(value);

  final CustomValidatorParams<T> onValidateError;

  @override
  CustomValidatorError? validator(T? value) =>
      onValidateError(value) ? null : CustomValidatorError.invalid;
}

extension CustomValidatorFormzX<T> on CustomValidatorFormz<T> {
  /// Method to change or revalidate value
  CustomValidatorFormz<T> dirty(T? value) {
    return CustomValidatorFormz<T>.dirty(value, onValidateError);
  }
}
