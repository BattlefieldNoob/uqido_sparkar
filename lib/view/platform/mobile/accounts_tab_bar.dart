import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:uqido_sparkar/view/platform/mobile/widgets/account_tab.dart';

class AccountsTabBar extends ConsumerWidget {
  const AccountsTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sparkARDataProvider);
    final colorScheme = Theme
        .of(context)
        .colorScheme;

    return TabBar(
      isScrollable: true,
      tabs: [
        ...state.map((e) =>
            ProviderScope(
                overrides: [currentUser.overrideWithValue(e)],
                child: const AccountTab()))
      ],
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: colorScheme.secondary,
    );
  }
}
