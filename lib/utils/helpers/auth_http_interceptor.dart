import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../blocs/blocs.dart';
import '../../services/services.dart';
import '../utils.dart';

class AuthHttpInterceptor extends Interceptor {
  AuthHttpInterceptor({
    required this.source,
    required this.dio,
  });

  /// Cache souce
  final AuthService source;
  final Dio dio;

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final headers = await _getHeaders();
      log('HEADERS: $headers', name: 'NETWORK');

      // Set token in headers
      options.headers.addAll(headers);
    } on ErrorException catch (e) {
      log('TOKEN ERROR: ${e.message}');
    } catch (e) {
      log('TOKEN ERROR: $e');
    } finally {
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 ||
        err.response?.statusCode == 403 ||
        err.response?.statusCode == 408) {
      final context = globalNavigatorKey.currentContext;
      if (context != null) {
        BlocProvider.of<AuthCubit>(context).logout();
        Navigator.of(context).popUntil(ModalRoute.withName('/'));
      }
    }

    handler.next(err);
  }

  // Getting all custom headers every request http
  Future<Map<String, dynamic>> _getHeaders() async {
    final headers = <String, dynamic>{};
    try {
      final result = await source.token();

      headers.putIfAbsent('Authorization', () => 'Bearer $result');
    } catch (_) {}

    return headers;
  }
}
