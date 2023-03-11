import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:widgets/widgets_grid.dart';

import '../sparkar/effect_list_item.dart';

class AccountsTabBarView extends ConsumerWidget {
  const AccountsTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(usersProvider);
    final effect = ref.watch(effectsProvider);

    final userEffects = user.map((u) => u.effects);

    final tabViews = [
      const PreferiteTabBarView(),
      ...userEffects.map((effectForUser) {
        final effects =
            effect.where((e) => effectForUser.contains(e.id)).toList();
        final builder = (context, index) => ProviderScope(
            overrides: [currentEffect.overrideWithValue(effects[index])],
            child: const EffectGridItem());
        return WidgetsGrid(builder, effects.length);
      })
    ];

    return TabBarView(children: tabViews);
  }
}

class PreferiteTabBarView extends ConsumerWidget {
  const PreferiteTabBarView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferites = ref.watch(preferiteEffects);

    final builder = (context, index) => ProviderScope(
        overrides: [currentEffect.overrideWithValue(preferites[index])],
        child: const EffectGridItem());

    return WidgetsGrid(builder, preferites.length);
  }
}
