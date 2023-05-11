import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/services/services.dart';
import 'package:movieapp/utils/utils.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

const url = 'https://api.themoviedb.org';

Future<void> setUpLocator() async {
  // ---------------------------------- CORE -----------------------------------
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: url,
      )
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) {
            log(obj.toString(), name: 'NETWORK');
          },
        ),
      ),
  );

  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }

  getIt.registerLazySingleton<HiveInterface>(() => Hive);

  // -------------------------------- END CORE ---------------------------------

  // -------------------------------- SERVICE ----------------------------------

  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(
      cacheClient: getIt(),
      httpClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<MoviesService>(
    () => MoviesServiceImpl(
      httpClient: getIt(),
    ),
  );

  // -------------------------------- END SERVICE ----------------------------------

  // --------------------------- STATE MANAGEMENT ------------------------------

  getIt.registerFactory(() => AuthCubit(service: getIt()));
  getIt.registerFactory(() => LoginCubit(service: getIt()));

  // --------------------------- END STATE MANAGEMENT ------------------------------

  // ------------------------------- HELPER ------------------------------------

  getIt.registerLazySingleton(
    () => AuthHttpInterceptor(source: getIt(), dio: getIt()),
  );
  getIt<Dio>().interceptors.add(getIt<AuthHttpInterceptor>());
}
