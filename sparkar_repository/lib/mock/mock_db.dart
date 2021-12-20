import 'dart:convert';
import 'dart:core';

import 'package:base_types/model/encrypted_login_data.dart';
import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter/services.dart';
import 'package:sparkar_data_model/sparkar_effect.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';
import 'package:sparkar_data_model/sparkar_user.dart';

class MockDB with DBCache implements AbstractRepository<SparkARNetworkData> {
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
