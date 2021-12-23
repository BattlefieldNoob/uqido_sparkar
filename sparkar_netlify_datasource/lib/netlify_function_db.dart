import 'dart:async';

import 'package:base_types/repository/abstract_repository.dart';
import 'package:dio/dio.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';
import 'package:sparkar_data_model/sparkar_repository.dart';
import 'rest_client.dart';

class NetlifyFunctionDB extends CachedBaseRepository<SparkARNetworkData> with SparkARDataSource, AuthRepository<NetlifyLoginData> {

  static final NetlifyFunctionDB _instance = NetlifyFunctionDB._internal();

  final RestClient _restClient;

  NetlifyFunctionDB._internal() : _restClient = RestClient(Dio());

  factory NetlifyFunctionDB.getInstance() {
    return _instance;
  }

  @override
  Future<SparkARNetworkData> getData() async {
    if(!(await isLogged())) {
      return SparkARNetworkData.empty();
    }

    final cookies="";

    final data = await _restClient.getUsersAndEffectWithCookie(cookies);
    print(data);

    if(data.data!=null) {
      return data.data!;
    } else {
      return SparkARNetworkData.empty();
    }
  }

  @override
  Future<List<String>> getPreferred() {
    throw UnimplementedError();
  }

  @override
  Future<bool> login(NetlifyLoginData loginData) async {
    try {
      final encpass = "";
      final lsd = "";


      final cookies = await _restClient.getCookiesWithEncryptedLoginData(
          encpass, lsd, loginData.email);
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}


class NetlifyLoginData extends BaseLoginData{
  final String email;
  final String password;

  NetlifyLoginData(this.email, this.password);
}