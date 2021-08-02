import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';

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
    return PreferredSize(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 100.0, 0.0),
          child: Text(
            "Good Evening, Christopher",
            style: TextStyle(
              color: Colors.blueGrey.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          child: Text("Accounts",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey.shade800)),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        TabBar(
          isScrollable: true,
          tabs: [...accounts.map((e) => userToTab(e))],
          indicatorSize: TabBarIndicatorSize.label,
        )
      ]),
      preferredSize: Size(0.0, 80.0),
    );
  }
}