import 'dart:developer';

import 'package:hive/hive.dart';

import '../utils.dart';

/// Callback when the request is success.
typedef CacheResponseCallBack<T> = Future<T> Function(T value);

/// Callback when hive Box is success
typedef _SuccessResponseBoxCallBack<T> = Future<T> Function(Box box);

/// {@template service_cache_handler_mixin}
/// Mixin to handle the cache/local data request.
/// {@endtemplate}
mixin ServiceCacheHandlerMixin {
  /// Returns the value associated with the given [dataKey]. If the key does not
  /// exist, throw [NotFoundCacheException]. And ff nay error
  /// about cahe, throw [GeneralCacheException].
  ///
  /// Params:
  /// - [cache] `required` an instance of [Hive]
  /// - [boxKey] `required` [Box] of [Hive]
  /// - [dataKey] `required` key to get the value from [Box]
  /// - [onSuccess] callback when the request is success
  ///
  /// Examples
  /// ```dart
  /// // Example 1
  /// final result = await getCache<String>(
  ///    Hive,
  ///    boxKey: 'BOX_KEY',
  ///    dataKey: 'DATA_KEY',
  /// );
  ///
  /// return AuthDataResponse.fromJson(json.decode(result));
  ///
  /// // Example 2:
  /// getCache<bool>(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///  );
  ///
  /// ```
  Future<T> getCache<T>(
    HiveInterface cache, {
    required String boxKey,
    required String dataKey,
    CacheResponseCallBack<T>? onSuccess,
  }) async {
    return _callWithErrorHandler<T>(
      cache: cache,
      boxKey: boxKey,
      action: (box) async {
        if (box.get(dataKey) == null || box.get(dataKey) is! T) {
          // throw error when data is not found
          throw NotFoundCacheException(
            message: 'The local data is not found',
          );
        }

        if (onSuccess != null) return onSuccess(box.get(dataKey));
        return box.get(dataKey);
      },
    );
  }

  /// Save data [value] to [Box] with data key from [dataKey]. If nay error
  /// about cahe, throw [GeneralCacheException].
  ///
  /// Params:
  /// - [cache] `required` an instance of [Hive]
  /// - [boxKey] `required` [Box] of [Hive]
  /// - [dataKey] `required` key to get the value from [Box]
  ///
  /// Examples
  ///
  /// ```dart
  /// // Example 1
  /// setCache<String>(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///   value: json.encode({'key': 'value'}),
  ///  );
  ///
  /// // Example 2:
  /// setCache<bool>(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///   value: true,
  ///  );
  ///
  /// ```
  Future<T> setCache<T>(
    HiveInterface cache, {
    required String boxKey,
    required String dataKey,
    required T value,
    CacheResponseCallBack<T>? onSuccess,
  }) async {
    return _callWithErrorHandler<T>(
      cache: cache,
      boxKey: boxKey,
      action: (box) async {
        await box.put(dataKey, value);
        if (onSuccess != null) return onSuccess(box.get(dataKey));

        return box.get(dataKey);
      },
    );
  }

  /// Delete data from box [boxKey] with key from [dataKey]. If nay error
  /// about cahe, throw [GeneralCacheException].
  ///
  /// Params:
  /// - [cache] `required` an instance of [Hive]
  /// - [boxKey] `required` [Box] of [Hive]
  /// - [dataKey] `required` key to get the value from [Box]
  ///
  /// Examples
  ///
  /// ```dart
  /// // Example 1
  /// deleteCache(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///   onSuccess: (isSuccess) => isSuccess,
  ///  );
  ///
  /// // Example 2:
  /// deleteCache(
  ///   Hive,
  ///   boxKey: 'BOX_KEY',
  ///   dataKey: 'DATA_KEY',
  ///  );
  ///
  Future<bool> deleteCache(
    HiveInterface cache, {
    required String boxKey,
    required String dataKey,
    CacheResponseCallBack<bool>? onSuccess,
  }) async {
    return _callWithErrorHandler<bool>(
      cache: cache,
      boxKey: boxKey,
      action: (box) async {
        await box.delete(dataKey);
        if (onSuccess != null) return onSuccess(true);

        return true;
      },
    );
  }

  // get box from hive
  Future<Box> _getBox(HiveInterface cache, String boxKey) async {
    if (!cache.isBoxOpen(boxKey)) {
      return cache.openBox(boxKey);
    }

    return cache.box(boxKey);
  }

  // call action with error handler
  Future<T> _callWithErrorHandler<T>({
    required _SuccessResponseBoxCallBack<T> action,
    required HiveInterface cache,
    required String boxKey,
  }) async {
    try {
      final box = await _getBox(cache, boxKey);

      return await action(box);
    } on ErrorException catch (_) {
      rethrow;
    } on HiveError catch (e) {
      throw GeneralCacheException(message: e.message);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace, error: stackTrace);
      throw ErrorCodeException(message: e.toString());
    }
  }
}
