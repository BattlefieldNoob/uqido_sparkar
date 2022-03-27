import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sparkar_providers/spark_ar_data_provider.dart';
import 'account_tab.dart';

class AccountsTabBar extends ConsumerWidget {
  const AccountsTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(usersProvider);
    final colorScheme = Theme.of(context).colorScheme;

    final tabs = [
      const PreferredAccountTab(),
      ...state.map((e) => ProviderScope(
          overrides: [currentUser.overrideWithValue(e)],
          child: const AccountTab()))
    ];

    return TabBar(
      isScrollable: true,
      tabs: tabs,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: colorScheme.secondary,
    );
  }
}