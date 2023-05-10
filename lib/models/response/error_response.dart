// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  final Map<String, String> errors;

  ErrorResponse({
    required this.errors,
  });

  @override
  List<Object?> get props => [errors];

  /// A factory to create [ErrorResponse] class from Json or Map
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    final newError = <String, String>{};

    for (final item in json.entries) {
      newError[item.key] = item.value.toString();
    }

    return ErrorResponse(errors: newError);
  }

  Map<String, dynamic> toJson() => errors;
}
