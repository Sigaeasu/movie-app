import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/utils/utils.dart';

typedef ApiResponseCallBack<T, R> = Future<T> Function(R Value);

mixin ServiceNetworkHandlerMixin {
  Future<T> get<T>(
    String url, {
    required Dio httpClient,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
  }) {
    return _callWithErrorHandler(
      _callToNetwork(url,
          httpClient: httpClient,
          method: 'GET',
          onSuccess: onSuccess,
          options: options),
    );
  }

  Future<T> post<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'POST',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
      ),
    );
  }

  Future<T> put<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'PUT',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
      ),
    );
  }

  Future<T> patch<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'PATCH',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
      ),
    );
  }

  Future<T> delete<T>(
    String url, {
    required Dio httpClient,
    required Object? payload,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
  }) {
    return _callWithErrorHandler<T>(
      _callToNetwork(
        url,
        httpClient: httpClient,
        method: 'DELETE',
        onSuccess: onSuccess,
        options: options,
        payload: payload,
      ),
    );
  }

  Future<T> _callToNetwork<T>(
    String url, {
    required Dio httpClient,
    Object? payload,
    required String method,
    required ApiResponseCallBack<T, Response> onSuccess,
    Options? options,
  }) async {
    late Response response;

    switch (method.toUpperCase().trim()) {
      case 'GET':
        response = await httpClient.get(url, options: options);
        break;
      case 'POST':
        response = await httpClient.post(url, data: payload, options: options);
        break;
      case 'PUT':
        response = await httpClient.put(url, data: payload, options: options);
        break;
      case 'PATCH':
        response = await httpClient.patch(url, data: payload, options: options);
        break;
      case 'DELETE':
        response =
            await httpClient.delete(url, data: payload, options: options);
        break;
      default:
        throw UnsupportedError('Method $method is not supported');
    }

    return onSuccess.call(response);
  }

  Future<T> _callWithErrorHandler<T>(Future<T> action,
      {BuildContext? context}) async {
    try {
      return await action;
    } on DioError catch (e, stackTrace) {
      if (context != null) {
        log(e.toString(), stackTrace: stackTrace, error: stackTrace);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ));
      }
      throw e.toServerException();
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace, error: stackTrace);
      throw ErrorCodeException(message: e.toString());
    }
  }

  // Future<T> _callWithErrorHandler<T>(Future<T> action) async {
  //   try {
  //     return await action;
  //   } on DioError catch (e, stackTrace) {
  //     log(e.toString(), stackTrace: stackTrace, error: stackTrace);
  //     throw e.toServerException(context);
  //   } catch (e, stackTrace) {
  //     log(e.toString(), stackTrace: stackTrace, error: stackTrace);
  //     throw ErrorCodeException(message: e.toString());
  //   }
  // }
}
