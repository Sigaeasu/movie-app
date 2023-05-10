import '../utils.dart';

/// Throws when code have error
///
class ErrorCodeException extends ErrorException {
  ErrorCodeException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() =>
      'ErrorCodeException(message: $message, code: $code, details: $details)';
}
