/*
class SparkARStateNotifier extends StateNotifier<SparkARNetworkData> {
  final BaseRepository db;

  SparkARStateNotifier({required this.db}) : super(SparkARNetworkData.empty()) {
    updateSparkARData();
  }

  Future<void> updateSparkARData() async {
    if (db is SparkARDataSource) {
      final dataSource = db as SparkARDataSource;
      SparkARNetworkData data = await dataSource.fetchData();

      final preferred = await dataSource.getPreferred();

      final effectsAndPreferred = data.effects
          .map((e) =>
              preferred.contains(e.id) ? e.copyWith(isPreferite: true) : e)
          .toList();

      state = SparkARNetworkData(data.users, effectsAndPreferred);
    }
  }

  void toggleFavorite(String effectId) {
    final editedEffects = [
      for (Effect effect in state.effects)
        effect.id != effectId
            ? effect
            : effect.copyWith(isPreferite: !effect.isPreferite)
    ];
    state = SparkARNetworkData(state.users, editedEffects);
  }
}
*/
