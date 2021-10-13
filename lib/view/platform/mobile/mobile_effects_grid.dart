import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_effect.dart';
import 'package:uqido_sparkar/view/sparkar/effect_list_item.dart';

class MobileEffectsGrid extends StatelessWidget {
  final List<SparkAREffect> effects;

  const MobileEffectsGrid(this.effects) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
        children: [
          ...effects.map((e) => EffectGridItem(effect: e))
        ]);
  }
}
