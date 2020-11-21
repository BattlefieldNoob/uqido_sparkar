import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cache/flutter_cache.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

class FirestoreDB {
  static final FirestoreDB _instance = FirestoreDB._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreDB._internal();

  factory FirestoreDB.getInstance() {
    return _instance;
  }

  Future<List<SparkARUser>> getAllUsers() async {
    var data =
        await Cache.remember('spark-ar-users', getDataFromFirestone, 120);

    return List.unmodifiable(data.map((e) => SparkARUser.fromJson(e)));
  }

  Future<List<Map<String, dynamic>>> getDataFromFirestone() async {
    var snapshot = await firestore.collection("spark-ar-users").get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
