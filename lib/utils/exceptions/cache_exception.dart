import 'package:movieapp/utils/utils.dart';

/// Exception thrown when the request local data processing dont have specify error.
class GeneralCacheException extends ErrorException {
  GeneralCacheException({
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
      'CacheException(message: $message, code: $code, details: $details)';
}

/// Thrown when cache is empty or not found
class NotFoundCacheException extends ErrorException {
  NotFoundCacheException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'NotFoundCacheException'
      '(message: $message, code: $code, details: $details)';
}

/// Throw when cache is expired
class ExpiredCacheException extends ErrorException {
  ExpiredCacheException({
    required String message,
    Object? code,
    Map<String, dynamic>? details,
  }) : super(
          message: message,
          code: code,
          details: details,
        );

  @override
  String toString() => 'ExpiredCacheException'
      '(message: $message, code: $code, details: $details)';
}
