import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_network_data.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

class SparkARStateNotifier extends StateNotifier<SparkARNetworkData> {
  final db;

  SparkARStateNotifier({required this.db}) : super(SparkARNetworkData.empty()) {
    updateSparkARData();
  }

  Future<void> updateSparkARData() async {
    SparkARNetworkData data = await db.getUsersAndEffectsData();

    state = state.copyWith(users: data.users, effects: data.effects);
  }

  void toggleFavorite(String userId, String effectId) {
    final editedEffects = [
      for (SparkAREffect effect in state.effects)
        effect.id != effectId
            ? effect
            : effect.copyWith(isPreferite: !effect.isPreferite)
    ];
    state = state.copyWith(effects: editedEffects);
  }
}
