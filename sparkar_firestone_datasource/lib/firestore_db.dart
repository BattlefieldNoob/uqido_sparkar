import 'dart:async';

import 'package:base_types/repository/abstract_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sparkar_data_model/sparkar_effect.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';
import 'package:sparkar_data_model/sparkar_repository.dart';
import 'package:sparkar_data_model/sparkar_user.dart';

class FirestoreDB extends CachedBaseRepository<SparkARNetworkData> with SparkARDataSource{
  static final FirestoreDB _instance = FirestoreDB._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreDB._internal();

  factory FirestoreDB.getInstance() {
    return _instance;
  }

  Future<List<Map<String,dynamic>>> _getDataFromFirestone() async {
    var snapshot = await firestore.collection("spark-ar-users").get();

    return snapshot.docs.where((e) => e.exists).map((e) => e.data()).toList();
  }

  @override
  Future<SparkARNetworkData> getData() async {
    final jsonResult = ((await checkCache('sparkar_users', _getDataFromFirestone)) as List<dynamic>).cast<Map<String,dynamic>>();

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


  Future<List<String>> _getPreferredFromFirestone() async {
    var snapshot = await firestore.collection("spark-ar-accounts").get();
    var account = snapshot.docs.firstWhere((element) => element.data().containsValue("xr@uqido.com"));
    final a = account.data()["preferred"];
    return (a as List<dynamic>).cast<String>();
  }


  @override
  Future<List<String>> getPreferred() async {
    return ((await checkCache('app_user_preferred', _getPreferredFromFirestone)) as List<dynamic>).cast<String>();
  }
}
