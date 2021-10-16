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
    List<SparkARUser>? users = [];
    users = await db.getAllUsers();
    if (users != null) {
      if (users.isNotEmpty) {
        print(db.toString() + " Runned successfully");
      } else {
        print(db.toString() + " Returned no data");
      }
    } else {
      print(db.toString() + " Raised an error, could not retrieve data");
    }

    if (users != null) {
      final effects = users.expand((e) => e.effects).toList();

      state = state.copyWith(users: users, effects: effects);
    }
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
