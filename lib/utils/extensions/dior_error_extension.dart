import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/utils/utils.dart';

extension DioErrorExtension on DioError {
  ErrorException toServerException() {
    ErrorResponse? errorDetails;
    String? apiMessage;

    if (response?.data != null && response?.data is Map) {
      apiMessage = (response?.data as Map)['message']?.toString();
      if (apiMessage == 'Unprocessable Entity') {
        apiMessage = 'Oop... Something is Wrong';
      }

      final jsonMeta = (response!.data as Map)['errors'] as Map?;
      if (jsonMeta is Map<String, dynamic>) {
        errorDetails = ErrorResponse.fromJson(jsonMeta);
      }
    }

    switch (type) {
      case DioErrorType.response:
        switch (response?.statusCode) {
          case 401:
            //  showSnackBar(context, 'Unauthentication Error');
            return UnAuthenticationServerException(
              message: apiMessage ?? message,
              details: errorDetails?.errors,
              code: response?.statusCode,
            );
          case 403:
            // showSnackBar(context, 'Unauthorize Error');
            return UnAuthorizeServerException(
              message: apiMessage ?? message,
              details: errorDetails?.errors,
              code: response?.statusCode,
            );
          case 404:
            // showSnackBar(context, 'Not Found Error');
            return NotFoundServerException(
              message: apiMessage ?? message,
              details: errorDetails?.errors,
              code: response?.statusCode,
            );
          case 500:
          case 502:
            // showSnackBar(context, 'Internal Server Error');
            return InternalServerException(
              message: apiMessage ?? message,
              details: errorDetails?.errors,
              code: response?.statusCode,
            );
          default:
            // showSnackBar(context, 'General Server Error');
            return GeneralServerException(
              message: apiMessage ?? message,
              details: errorDetails?.errors,
              code: response?.statusCode,
            );
        }
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        // showSnackBar(context, 'Timeout Error');
        return TimeOutServerException(
          message: 'Oops, Sepertinya koneksi Anda sedang tidak stabil',
          details: errorDetails?.errors,
          code: response?.statusCode,
        );

      case DioErrorType.cancel:
      case DioErrorType.other:
        //  showSnackBar(context, 'General Error');
        return GeneralServerException(
          message: 'Oops, Sepertinya koneksi Anda sedang tidak stabil',
          details: errorDetails?.errors,
          code: response?.statusCode,
        );
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }
}
