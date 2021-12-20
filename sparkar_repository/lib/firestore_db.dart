import 'dart:async';

import 'package:base_types/model/encrypted_login_data.dart';
import 'package:base_types/repository/abstract_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';

class FirestoreDB with DBCache implements AbstractRepository<SparkARNetworkData> {
  static final FirestoreDB _instance = FirestoreDB._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreDB._internal();

  factory FirestoreDB.getInstance() {
    return _instance;
  }

  @override
  Future<SparkARNetworkData> getUsersAndEffectsData(
      {String? email, EncryptedLoginData? loginData}) async {
    //try {
    //  final data =
    //      await checkCache('spark-ar-users-firestone', getDataFromFirestone);
    //  return List.unmodifiable(data.map((e) => SparkARUser.fromJson(e)));
    //} catch (e) {
    //  print(e);
    //  return [];
    //}
    return SparkARNetworkData.empty();
  }

  Future<List<Map<String, dynamic>>> getDataFromFirestone() async {
    var snapshot = await firestore.collection("spark-ar-users").get();
    return snapshot.docs.where((e) => e.exists).map((e) => e.data()).toList();
  }
}
