import 'dart:async';

import 'package:base_types/repository/abstract_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;
import 'package:data_model/owner.dart';
import 'package:data_model/sparkar_repository.dart';

import 'facebook_password_encrypt_util.dart';
import 'rest_client.dart';

class NetlifyFunctionDB extends CachedBaseRepository<List<Owner>>
    with SparkARDataSource, AuthRepository<NetlifyLoginData> {
  static final NetlifyFunctionDB _instance = NetlifyFunctionDB._internal();

  final RestClient _restClient;

  NetlifyFunctionDB._internal() : _restClient = RestClient(Dio());

  factory NetlifyFunctionDB.getInstance() {
    return _instance;
  }

  Future<List<Owner>> _getDataFromNetlify() async {
    final cookies = await cache.load("login_cookies", "") as String;

    final data = await _restClient.getUsersAndEffectWithCookie(cookies);

    return data.data!;
  }

  @override
  Future<List<Owner>> fetchData() async {
    if (!(await isLogged())) {
      return [];
    }

    try {
      return await cache.remember("sparkar_users", _getDataFromNetlify);
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<String>> getPreferred() {
    return Future.value(["429169167683036"]);
  }

  @override
  Future<bool> login(NetlifyLoginData loginData) async {
    //await logout(); //clear old data
    try {
      await cache.remember(
          "login_cookies", () => _loginAndReturnCookies(loginData));
      //all ok, save cookies to data
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> _loginAndReturnCookies(NetlifyLoginData loginData) async {
    final publicKeys = await _restClient.getPublicKeys();

    var encpass = await passwordEncrypt(loginData.password, publicKeys.data!);

    final lsd = publicKeys.data!.lsd;

    final cookiesResponse = await _restClient.getCookiesWithEncryptedLoginData(
        encpass, lsd, loginData.email);

    return cookiesResponse.data!.cookie;
  }

  @override
  Future<bool> isLogged() async {
    final cookies = await cache.load("login_cookies", "") as String;
    return cookies.isNotEmpty;
  }

  @override
  Future<bool> logout() async {
    await cache.destroy("login_cookies");
    await cache.destroy("sparkar_users");
    await cache.destroy("app_user_preferred");
    return Future.value(true);
  }
}

class NetlifyLoginData extends BaseLoginData {
  final String email;
  final String password;

  NetlifyLoginData(this.email, this.password);
}