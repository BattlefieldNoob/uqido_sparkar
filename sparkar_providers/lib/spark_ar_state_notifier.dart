import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sparkar_data_model/sparkar_effect.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';
import 'package:sparkar_data_model/sparkar_repository.dart';
import 'package:sparkar_netlify_datasource/netlify_function_db.dart';

class SparkARStateNotifier extends StateNotifier<SparkARNetworkData> {
  final BaseRepository db;

  SparkARStateNotifier({required this.db}) : super(SparkARNetworkData.empty()) {
    updateSparkARData();
  }

  Future<void> updateSparkARData() async {


    if(db is AuthRepository){
      final dataSource = db as AuthRepository;
      if(!(await dataSource.isLogged())){
        final loginResult = await dataSource.login(NetlifyLoginData("antonio.ruggiero93@hotmail.it", "b]an<A5}]2wX[PM="));
        if (!loginResult){
          throw Exception("MEMMEMEEMEMMEM");
        }
      }
    }



    if (db is SparkARDataSource) {
      final dataSource = db as SparkARDataSource;
      SparkARNetworkData data = await dataSource.getData();

      final preferred = await dataSource.getPreferred();

      final effectsAndPreferred = data.effects.map((e) => preferred.contains(e.id) ? e.copyWith(isPreferite: true) : e).toList();

      state = SparkARNetworkData(data.users, effectsAndPreferred);
    }
  }

  void toggleFavorite(String effectId) {
    final editedEffects = [
      for (SparkAREffect effect in state.effects)
        effect.id != effectId
            ? effect
            : effect.copyWith(isPreferite: !effect.isPreferite)
    ];
    state = SparkARNetworkData(state.users, editedEffects);
  }
}
