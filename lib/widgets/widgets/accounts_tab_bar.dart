import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/providers/data_provider.dart';

import 'account_tab.dart';

class AccountsTabBar extends ConsumerWidget {
  const AccountsTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(fetchDataProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return data.maybeWhen(
        orElse: () => CircularProgressIndicator(),
        data: (owners) {
          final tabs = [
            //const PreferredAccountTab(),
            ...owners.map((e) => ProviderScope(
                overrides: [currentUser.overrideWithValue(e)],
                child: const AccountTab()))
          ];

          return TabBar(
            isScrollable: true,
            tabs: tabs,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: colorScheme.secondary,
          );
        });
  }
}
