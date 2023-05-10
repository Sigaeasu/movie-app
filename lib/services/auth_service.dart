import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:movieapp/constants/constants.dart';
import 'package:movieapp/models/models.dart';
import 'package:movieapp/utils/utils.dart';

abstract class AuthService {
  Future<AuthDataResponse> login(LoginBody data);
  Future<bool> logout();
  Future<User> currentUser();
  Future<String> token();
}

class AuthServiceImpl
    with ServiceNetworkHandlerMixin, ServiceCacheHandlerMixin
    implements AuthService {
  AuthServiceImpl({
    required this.cacheClient,
    required this.httpClient,
  });

  final HiveInterface cacheClient;
  final Dio httpClient;

  final cacheKey = CacheKeys.userData;

  @override
  Future<AuthDataResponse> login(LoginBody data) async {
    final data = ApiResponse<AuthDataResponse>.fromJson(
      {
        'status': 200,
        'message': 'success',
        'data': {
          'user': {
            'id': 1,
            'name': 'Sigi',
          },
          'token':
              'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMWUyNGMyOWJhNTMwZDM4ZmJkMjNmYWQ5ZDcwZDAxMCIsInN1YiI6IjY0NTBiODM4NDM1MDExMDE0MTM1YjkyNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2DtZT7vIH4PzGMbKh87Blh47SPUhpVGKrm9iwMBO1Ek'
        }
      },
      (json) => AuthDataResponse.fromJson(json as Map<String, dynamic>),
    );
    await _saveAuthenticationCache(data.data);
    return data.data;
  }

  Future<AuthDataResponse> _saveAuthenticationCache(
    AuthDataResponse data,
  ) async {
    final result = await setCache<String>(
      cacheClient,
      boxKey: cacheKey,
      dataKey: cacheKey,
      value: json.encode(data.toJson()),
    );

    return AuthDataResponse.fromJson(json.decode(result));
  }

  @override
  Future<bool> logout() async {
    return deleteCache(
      cacheClient,
      boxKey: cacheKey,
      dataKey: cacheKey,
    );
  }

  @override
  Future<User> currentUser() async {
    final result = await getCache<String>(
      cacheClient,
      boxKey: cacheKey,
      dataKey: cacheKey,
    );

    return AuthDataResponse.fromJson(json.decode(result)).user;
  }

  @override
  Future<String> token() async {
    final result = await getCache<String>(
      cacheClient,
      boxKey: cacheKey,
      dataKey: cacheKey,
    );

    return AuthDataResponse.fromJson(json.decode(result)).token;
  }
}
