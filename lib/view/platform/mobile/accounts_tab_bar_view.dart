import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    final tabViews = user.map((e) => MobileEffectsGrid(e.id,
        effect.where((effect) => e.effects.contains(effect.id)).toList()));

    return TabBarView(children: tabViews.toList());
  }
}
