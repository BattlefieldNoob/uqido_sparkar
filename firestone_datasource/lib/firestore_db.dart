import 'dart:async';
import 'dart:convert';

import 'package:base_types/repository/abstract_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_model/owner.dart';
import 'package:data_model/sparkar_repository.dart';

class FirestoreDB extends CachedBaseRepository<List<Owner>>
    with SparkARDataSource {
  static final FirestoreDB _instance = FirestoreDB._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreDB._internal();

  factory FirestoreDB.getInstance() {
    return _instance;
  }

  Future<String> _getDataFromFirestone() async {
    var snapshot = await firestore.collection("spark-ar-users").get();

    return snapshot.docs
        .where((e) => e.exists)
        .map((e) => e.data())
        .toList()
        .toString();
  }

  @override
  Future<List<Owner>> fetchData() async {
    final jsonResult = await checkCache('sparkar_users', _getDataFromFirestone);
    return jsonDecode(jsonResult) as List<Owner>;
  }

  Future<List<String>> _getPreferredFromFirestone() async {
    var snapshot = await firestore.collection("spark-ar-accounts").get();
    var account = snapshot.docs
        .firstWhere((element) => element.data().containsValue("xr@uqido.com"));
    final a = account.data()["preferred"];
    return (a as List<dynamic>).cast<String>();
  }

  @override
  Future<List<String>> getPreferred() async {
    return ((await checkCache('app_user_preferred', _getPreferredFromFirestone))
            as List<dynamic>)
        .cast<String>();
  }
}
