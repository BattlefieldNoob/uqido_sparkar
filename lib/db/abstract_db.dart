import 'package:flutter/foundation.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;
import 'package:uqido_sparkar/model/sparkar_user.dart';

abstract class AbstractDB {
  Future<List<SparkARUser>?> getAllUsers({String? email, String? password});
}

mixin DBCache {
  Duration get defaultCacheDuration {
    if (kReleaseMode) {
      return Duration(hours: 4); //4 hours
    } else {
      return Duration(minutes: 1);
    }
  }

  Future<List<dynamic>> checkCache<T>(String key, Future<List<T>> Function() f,
      {Duration? customCacheDuration}) async {
    final cacheDuration = customCacheDuration ?? defaultCacheDuration;
    final data =
        await cache.remember(key, f, cacheDuration.inSeconds) as List<dynamic>;

    if (data.isEmpty) {
      print("DELETE KEY, DATA IS EMPTY");
      cache.destroy(key); //i don't want to cache empty data
    }
    return data;
  }
}
