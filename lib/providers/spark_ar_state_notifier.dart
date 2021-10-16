import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

class SparkARStateNotifier extends StateNotifier<List<SparkARUser>> {
  final db;

  SparkARStateNotifier({required this.db}) : super([]) {
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

    if (users != null && users.isNotEmpty) state = users;
  }

  void toggleFavorite(String userId, String effectId) {
    state = [
      for (SparkARUser user in state)
        user.id != userId
            ? user
            : user.copyWith(effects: [
                for (SparkAREffect effect in user.effects)
                  effect.id != effectId
                      ? effect
                      : effect.copyWith(isPreferite: !effect.isPreferite)
              ])
    ];
  }
}
