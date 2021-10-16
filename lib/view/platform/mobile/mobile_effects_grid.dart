import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:uqido_sparkar/view/sparkar/effect_list_item.dart';

class MobileEffectsGrid extends StatelessWidget {
  final List<SparkAREffect> effects;

  const MobileEffectsGrid(this.effects) : super(key: null);

  @override
  Widget build(BuildContext context) {
    if (effects.isEmpty)
      return Center(
        child: Text("No Elements!"),
      );
    else
      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemCount: effects.length,
        itemBuilder: (context, index) => ProviderScope(overrides: [
          currentEffect.overrideWithValue(effects[index])
        ], child: const EffectGridItem()),
      );
  }
}
