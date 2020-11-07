import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

class FirestoreDB {
  static final FirestoreDB _instance = FirestoreDB._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreDB._internal();

  factory FirestoreDB.getInstance() {
    return _instance;
  }

  Future<List<SparkARUser>> getAllUsers() async {
    var snapshot = await firestore.collection("spark-ar-users").get();
    return List.unmodifiable(snapshot.docs.map((e) => SparkARUser.fromJson(e.data())));
  }
}
