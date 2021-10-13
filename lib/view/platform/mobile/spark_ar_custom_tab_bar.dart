import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/extensions.dart';
import 'package:uqido_sparkar/view/platform/mobile/widgets/account_tab.dart';

part 'spark_ar_custom_tab_bar.viewmodel.dart';

class SparkARCustomTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SparkARCustomTabBar({
    Key? key,
    required this.accounts,
  }) : super(key: key);

  @override
  Size get preferredSize => Size(0.0, 80.0);

  final List<SparkARUser> accounts;

  @override
  Widget build(BuildContext context) {
    final colorScheme=Theme.of(context).colorScheme;
    return PreferredSize(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 100.0, 0.0),
          child: "Good Evening".h1,
        ),
        Padding(
          child: "Accounts".h2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        TabBar(
          isScrollable: true,
          tabs: [...accounts.map((e) => AccountTab(e.name, e.iconUrl))],
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: colorScheme.secondary,
        ),
        const SizedBox(height: 8,)
      ]),
      preferredSize: preferredSize,
    );
  }
}
