import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum LoginState{
  unknown,
  notLogged,
  logged
}


class SparkARAuthNotifier extends StateNotifier<LoginState> {
  final BaseRepository db;

  SparkARAuthNotifier({required this.db}) : super(LoginState.unknown);



}