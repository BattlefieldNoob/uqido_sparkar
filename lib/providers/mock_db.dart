import 'dart:convert';
import 'dart:core';

import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:data_model/owner.dart';
import 'package:data_model/sparkar_repository.dart';

part 'mock_db.g.dart';

@riverpod
SparkARDataSource mockDB(MockDBRef ref) {
  return MockDB();
}

class MockDB extends CachedBaseRepository<List<Owner>> with SparkARDataSource {
  const MockDB();

  @override
  Future<List<Owner>> fetchData() async {
    String data = await rootBundle.loadString('assets/mock.json');
    return (jsonDecode(data) as List<dynamic>)
        .map((e) => Owner.fromJson(e))
        .toList();
  }

  @override
  Future<List<String>> getPreferred() {
    // TODO: implement getPreferred
    throw UnimplementedError();
  }
}
