import 'package:formz/formz.dart';

/// unvalidated validator that can be used to validate a [T].
class UnValidatedFormz<T> extends FormzInput<T?, Object> {
  const UnValidatedFormz.pure() : super.pure(null);
  const UnValidatedFormz.dirty(T? value) : super.dirty(value);

  @override
  Object? validator(T? value) => null;
}

extension UnValidatedFormzX<T> on UnValidatedFormz<T> {
  /// Method to change or revalidate value
  UnValidatedFormz<T> dirty(T? value) {
    return UnValidatedFormz<T>.dirty(value);
  }
}
