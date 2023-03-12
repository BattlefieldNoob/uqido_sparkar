import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/providers/data_provider.dart';
import 'package:widgets/widgets_grid.dart';

import '../sparkar/effect_list_item.dart';

class AccountsTabBarView extends ConsumerWidget {
  const AccountsTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(fetchDataProvider);

    return data.maybeWhen(
        orElse: () => CircularProgressIndicator(),
        data: (owners) {
          final tabViews = [
            //const PreferiteTabBarView(),
            ...owners.map((effectForUser) {
              final builder = (context, index) => ProviderScope(overrides: [
                    currentEffect
                        .overrideWithValue(effectForUser.effects[index])
                  ], child: const EffectGridItem());
              return WidgetsGrid(builder, effectForUser.effects.length);
            })
          ];

          return TabBarView(children: tabViews);
        });
  }
}

//class PreferiteTabBarView extends ConsumerWidget {
//  const PreferiteTabBarView();
//
//  @override
//  Widget build(BuildContext context, WidgetRef ref) {
//    final preferites = ref.watch(preferiteEffects);
//
//    final builder = (context, index) => ProviderScope(
//        overrides: [currentEffect.overrideWithValue(preferites[index])],
//        child: const EffectGridItem());
//
//    return WidgetsGrid(builder, preferites.length);
//  }
//}
