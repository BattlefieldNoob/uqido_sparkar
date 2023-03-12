import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sparkar_data_model/effect.dart';
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

final currentUser = Provider<Owner>((ref) => throw UnimplementedError());
final currentEffect = Provider<Effect>((ref) => throw UnimplementedError());

//final repositoryProvider = Provider<BaseRepository>((ref) => MockDB.getInstance(),
//    name: "Repository Provider");
/*final repositoryProvider = Provider<BaseRepository>(
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

final usersProvider = Provider<List<Owner>>(
    (ref) => ref.watch(sparkARDataProvider).users,
    name: "Users Provider",
    dependencies: [sparkARDataProvider]);

final effectsProvider = Provider<List<Effect>>(
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
*/
