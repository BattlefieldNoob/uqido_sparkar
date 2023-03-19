import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sparkar_data_model/owner.dart';
import 'package:uqido_sparkar/providers/mock_db.dart';

part 'data_provider.g.dart';

@riverpod
Future<List<Owner>> fetchData(FetchDataRef ref) async {
  return await ref.watch(mockDBProvider).fetchData();
}

@riverpod
Future<bool> auth(AuthRef ref) async {
  return Future.value(true);
}
