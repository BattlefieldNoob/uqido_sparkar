import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';

import 'mobile_effects_grid.dart';

class AccountsTabBarView extends ConsumerWidget {
  const AccountsTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(users);
    final effect = ref.watch(effects);

    final tabViews = [
      const PreferiteTabBarView(),
      ...user.map((e) => MobileEffectsGrid(
          effect.where((effect) => e.effects.contains(effect.id)).toList()))
    ];

    return TabBarView(children: tabViews);
  }
}

class PreferiteTabBarView extends ConsumerWidget {
  const PreferiteTabBarView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferites = ref.watch(preferiteEffects);

    return MobileEffectsGrid(preferites);
  }
}
