import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/facebook_password_encrypt_util.dart';

class FirestoreDB with DBCache implements AbstractDB {
  static final FirestoreDB _instance = FirestoreDB._internal();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreDB._internal();

  factory FirestoreDB.getInstance() {
    return _instance;
  }

  @override
  Future<List<SparkARUser>?> getAllUsers(
      {String? email, EncryptedLoginData? loginData}) async {
    try {
      final data =
          await checkCache('spark-ar-users-firestone', getDataFromFirestone);
      return List.unmodifiable(data.map((e) => SparkARUser.fromJson(e)));
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getDataFromFirestone() async {
    var snapshot = await firestore.collection("spark-ar-users").get();
    return snapshot.docs.where((e) => e.exists).map((e) => e.data()!).toList();
  }
}
