import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

typedef DataFromJsonBuilder<T> = T Function(Object? json);
typedef DataToJsonBuilder<T, M> = M Function(T? data);

class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  /// A factory to create [ApiResponse] class from Json or Map [json] params
  ///
  /// [json] is a json object or a map object
  /// [create] ia a callback how to generate a type from json object
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    DataFromJsonBuilder<T> create,
  ) =>
      ApiResponse(
        status: StringParser.parse(json['status']),
        message: StringParser.parse(json['message']),
        data: create(json['data'] as Object),
      );

  final T data;
  final String status;
  final String message;

  /// Returning a [Map] json object from this [ApiResponse]
  ///
  /// [dataToJson] is a callback how to generate a json object from type
  Map<String, dynamic> toJson(DataToJsonBuilder<T, Object?> dataToJson) =>
      <String, dynamic>{
        'status': status,
        'message': message,
        'data': dataToJson(data),
      };

  @override
  List<Object?> get props => [data, status, message];
}
