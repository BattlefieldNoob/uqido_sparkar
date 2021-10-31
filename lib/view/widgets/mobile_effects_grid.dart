import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
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
    else {
      final layoutData = ResponsiveWrapper.of(context);

      final columns = layoutData.isMobile
          ? 2
          : layoutData.isTablet
              ? 3
              : 4;

      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2),
        itemCount: effects.length,
        itemBuilder: (context, index) => ProviderScope(
            overrides: [currentEffect.overrideWithValue(effects[index])],
            child: const EffectGridItem()),
      );
    }
  }
}
