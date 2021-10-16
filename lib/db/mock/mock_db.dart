import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/db/rest_client.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_network_data.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

class MockDB with DBCache implements AbstractDB {
  static final MockDB _instance = MockDB._internal();

  MockDB._internal();

  factory MockDB.getInstance() {
    return _instance;
  }

  @override
  Future<SparkARNetworkData> getUsersAndEffectsData(
      {String? email, EncryptedLoginData? loginData}) async {
    String data = await rootBundle.loadString('assets/mock_data.json');
    final jsonResult = json.decode(data) as List<dynamic>; //array of SparkARUser

    //TODO remove after editing BE
    final users = jsonResult.map((user) => SparkARUser(
        user['id'] as String,
        user['name'] as String,
        user['iconUrl'] as String,
        (user['effects'] as List<dynamic>)
            .map((e) => e['id'] as String)
            .toList())).toList();

    //TODO remove after editing BE
    final effects = jsonResult
        .expand((user) => user['effects'] as List<dynamic>)
        .map((effect) => SparkAREffect.fromJson(effect)).toList();

    return SparkARNetworkData(users, effects);
  }
}
