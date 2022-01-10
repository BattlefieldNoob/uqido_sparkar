import 'package:flutter/foundation.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;


abstract class BaseLoginData{

}

abstract class BaseRepository {

}

mixin AuthRepository<T extends BaseLoginData> {

  Future<bool> login(T loginData);
  Future<bool> isLogged();
  Future<bool> logout();

}


abstract class CachedBaseRepository<T> extends BaseRepository {

  Duration get defaultCacheDuration {
    if (kReleaseMode) {
      return const Duration(hours: 4); //4 hours
    } else {
      return const Duration(minutes: 1);
    }
  }

  Future<dynamic> checkCache<T>(String key, Future<T> Function() f,
      {Duration? customCacheDuration}) async {
    final cacheDuration = customCacheDuration ?? defaultCacheDuration;
    return await cache.remember(key, f, cacheDuration.inSeconds);
  }
}