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

  Future<List<Map<String,dynamic>>> _getUsersFromFirestone() async {
    var snapshot = await firestore.collection("users").get();

    return snapshot.docs.where((e) => e.exists).map((e) => e.data()).toList();
  }

  Future<List<Map<String,dynamic>>> _getEffectsFromFirestone() async {
    var snapshot = await firestore.collection("effects").get();

    return snapshot.docs.where((e) => e.exists).map((e) => e.data()).toList();
  }

  @override
  Future<SparkARNetworkData> getData() async {
    final usersJson = ((await checkCache('users', _getUsersFromFirestone)) as List<dynamic>).cast<Map<String,dynamic>>();

    final users = usersJson.map((user) => SparkARUser.fromJson(user)).toList();

    final effectsJson = ((await checkCache('effects', _getEffectsFromFirestone)) as List<dynamic>).cast<Map<String,dynamic>>();

    final effects = effectsJson.map((effect) => SparkAREffect.fromJson(effect)).toList();

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
