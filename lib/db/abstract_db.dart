import 'package:flutter/foundation.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;
import 'package:uqido_sparkar/model/sparkar_network_data.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

abstract class AbstractDB {
  Future<SparkARNetworkData> getUsersAndEffectsData(
      {String? email, EncryptedLoginData? loginData});
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
