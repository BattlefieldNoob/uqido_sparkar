import 'package:base_types/repository/abstract_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sparkar_data_model/sparkar_effect.dart';
import 'package:sparkar_data_model/sparkar_network_data.dart';
import 'package:sparkar_data_model/sparkar_repository.dart';

class SparkARStateNotifier extends StateNotifier<SparkARNetworkData> {
  final BaseRepository db;

  SparkARStateNotifier({required this.db}) : super(SparkARNetworkData.empty()) {
    updateSparkARData();
  }

  Future<void> updateSparkARData() async {

    if (db is SparkARDataSource) {
      final dataSource = db as SparkARDataSource;
      SparkARNetworkData data = await dataSource.getData();

      final preferred = await dataSource.getPreferred();

      final effectsAndPreferred = data.effects.map((e) => preferred.contains(e.id) ? e.copyWith(isPreferite: true) : e).toList();

      state = state.copyWith(users: data.users, effects: effectsAndPreferred);
    }
  }

  void toggleFavorite(String effectId) {
    final editedEffects = [
      for (SparkAREffect effect in state.effects)
        effect.id != effectId
            ? effect
            : effect.copyWith(isPreferite: !effect.isPreferite)
    ];
    state = state.copyWith(effects: editedEffects);
  }
}
