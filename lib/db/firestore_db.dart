import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cache/flutter_cache.dart';
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

class FirestoreDB implements AbstractDB {
  static final FirestoreDB _instance = FirestoreDB._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreDB._internal();

  factory FirestoreDB.getInstance() {
    return _instance;
  }

  @override
  Future<List<SparkARUser>> getAllUsers() async {
    print(" GET DATA!");
    final data = await Cache.remember(
        'spark-ar-users-firestone', getDataFromFirestone, 120);
    print(" with DATA!");

    List<SparkARUser> mapped = <SparkARUser>[];

    for (final user in data) {
      mapped.add(SparkARUser.fromJson(user));
    }
    print(" with MEMS!");
    return mapped;
  }

  Future<List<Map<String, dynamic>>> getDataFromFirestone() async {
    print(" GET DATA! firestone");
    var snapshot = await firestore.collection("spark-ar-users").get();
    print(" SNAPSHOT!");
    return snapshot.docs.where((e) => e.exists).map((e) => e.data()!).toList();
  }
}
