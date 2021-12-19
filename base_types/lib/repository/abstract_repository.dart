import 'package:flutter/foundation.dart';
import '../model/encrypted_login_data.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;

abstract class AbstractRepository<T> {
  Future<T> getUsersAndEffectsData(
      {String? email, EncryptedLoginData? loginData});
}

mixin DBCache {
  Duration get defaultCacheDuration {
    if (kReleaseMode) {
      return const Duration(hours: 4); //4 hours
    } else {
      return const Duration(minutes: 1);
    }
  }

  Future<List<dynamic>> checkCache<T>(String key, Future<List<T>> Function() f,
      {Duration? customCacheDuration}) async {
    final cacheDuration = customCacheDuration ?? defaultCacheDuration;
    final data =
        await cache.remember(key, f, cacheDuration.inSeconds) as List<dynamic>;

    if (data.isEmpty) {
      if (kDebugMode) {
        print("DELETE KEY, DATA IS EMPTY");
      }
      cache.destroy(key); //i don't want to cache empty data
    }
    return data;
  }
}
