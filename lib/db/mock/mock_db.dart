import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/db/rest_client.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

class MockDB with DBCache implements AbstractDB {
  static final MockDB _instance = MockDB._internal();

  MockDB._internal();

  factory MockDB.getInstance() {
    return _instance;
  }

  @override
  Future<List<SparkARUser>> getAllUsers(
      {String? email, EncryptedLoginData? loginData}) async {
    String data = await rootBundle.loadString('assets/mock_data.json');
    final jsonResult = json.decode(data);
    return List.unmodifiable(jsonResult.map((e) => SparkARUser.fromJson(e)));
  }
}
