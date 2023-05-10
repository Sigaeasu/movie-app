// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ErrorException implements Exception {
  final String message;
  final Object? code;
  final Map<String, dynamic>? details;
  ErrorException({
    required this.message,
    this.code,
    this.details,
  });
}

extension ErrorExceptionExtension on ErrorException {
  /// Create a summary error message from details
  /// If the [details] is null than return [message]
  String get getDetailsMessage {
    if (details == null || (details?.isEmpty ?? false)) return message;

    final messages = details!.values;
    if (messages.length == 1) return messages.first;

    return messages.toSet().map((e) => '• $e').toList().join('\n');
  }
}
