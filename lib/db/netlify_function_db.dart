import 'dart:async';
import 'dart:convert';

import 'package:flutter_cache/flutter_cache.dart';
import 'package:http/http.dart' as http;
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

class NetlifyFunctionDB implements AbstractDB {
  static final NetlifyFunctionDB _instance = NetlifyFunctionDB._internal();

  NetlifyFunctionDB._internal();

  factory NetlifyFunctionDB.getInstance() {
    return _instance;
  }

  @override
  Future<List<SparkARUser>> getAllUsers() async {
    var data =
        await Cache.remember('spark-ar-users-netlify', getDataFromNetlify, 120);

    return List.unmodifiable(data.map((e) => SparkARUser.fromJson(e)));
  }

  Future<List<Map<String, dynamic>>> getDataFromNetlify() async {
    final response = await http.get(Uri.https(
        'sparkar-token-crawler.netlify.app',
        '.netlify/functions/sparkar_fetch'));

    print(response.body);
    print(jsonDecode(response.body));

    return List.empty();
  }
}
