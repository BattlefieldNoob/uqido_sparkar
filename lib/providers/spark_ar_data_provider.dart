import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/db/abstract_db.dart';
import 'package:uqido_sparkar/db/mock/mock_db.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/providers/spark_ar_state_notifier.dart';

final repositoryProvider = Provider<AbstractDB>(
  (ref) => MockDB.getInstance(),
);

final sparkARDataProvider =
    StateNotifierProvider<SparkARStateNotifier, List<SparkARUser>>(
        (ref) => SparkARStateNotifier(db: ref.watch(repositoryProvider)));

final usersCount =
    Provider<int>((ref) => ref.watch(sparkARDataProvider).length);

final currentUserId = Provider<String>((ref) => throw UnimplementedError());
final currentUser = Provider<SparkARUser>((ref) => throw UnimplementedError());
final currentEffect =
    Provider<SparkAREffect>((ref) => throw UnimplementedError());
