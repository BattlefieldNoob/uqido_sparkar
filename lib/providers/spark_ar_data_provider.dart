import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sparkar_data_model/sparkar_effect.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';
import 'package:sparkar_data_model/sparkar_user.dart';
import 'package:sparkar_netlify_datasource/netlify_function_db.dart';
import 'package:uqido_sparkar/providers/spark_ar_state_notifier.dart';

//final repositoryProvider = Provider<BaseRepository>((ref) => MockDB.getInstance(),
//    name: "Repository Provider");
final repositoryProvider = Provider<BaseRepository>(
    (ref) => NetlifyFunctionDB.getInstance(),
    name: "Repository Provider");

final authProvider = FutureProvider<bool>((ref) async {
  final db = ref.watch(repositoryProvider);
  if (db is AuthRepository) {
    final datasource = db as AuthRepository;
    return datasource.isLogged();
  } else {
    return true;
  }
}, name: "Auth Provider");

final sparkARDataProvider =
    StateNotifierProvider<SparkARStateNotifier, SparkARNetworkData>(
        (ref) => SparkARStateNotifier(db: ref.watch(repositoryProvider)),
        name: "Data Provider",
        dependencies: [repositoryProvider]);

final usersCount = Provider<int>(
    (ref) => ref.watch(sparkARDataProvider).users.length,
    name: "User count Provider",
    dependencies: [sparkARDataProvider]);

final usersProvider = Provider<List<SparkARUser>>(
    (ref) => ref.watch(sparkARDataProvider).users,
    name: "Users Provider",
    dependencies: [sparkARDataProvider]);

final effectsProvider = Provider<List<SparkAREffect>>(
    (ref) => ref.watch(sparkARDataProvider).effects,
    name: "Effects Provider",
    dependencies: [sparkARDataProvider]);

final preferiteEffects = Provider(
    (ref) => ref
        .watch(sparkARDataProvider)
        .effects
        .where((e) => e.isPreferite)
        .toList(),
    name: "Preferite Provider",
    dependencies: [sparkARDataProvider]);

final currentUserId = Provider<String>((ref) => throw UnimplementedError());
final currentUser = Provider<SparkARUser>((ref) => throw UnimplementedError());
final currentEffect =
    Provider<SparkAREffect>((ref) => throw UnimplementedError());
