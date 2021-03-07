import 'package:flutter/foundation.dart';
import 'package:flutter_cache/flutter_cache.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

abstract class AbstractDB {
  Future<List<SparkARUser>?> getAllUsers(
      String encryptedEmail, String encryptedPassword);
}

mixin DBCache {
  int get cacheDuration {
    if (kReleaseMode) {
      return 14400; //4 hours
    } else {
      return 60;
    }
  }

  Future<List<dynamic>> checkCache(
      String key, Future<List<Map<String, dynamic>>> Function() f) async {
    final data = await Cache.remember(key, f, cacheDuration) as List<dynamic>;

    if (data.isEmpty) {
      print("DELETE KEY, DATA IS EMPTY");
      Cache.destroy(key); //i don't want to cache empty data
    }
    return data;
  }
}
