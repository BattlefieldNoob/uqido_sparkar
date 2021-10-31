import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:uqido_sparkar/utils/extensions.dart';
import 'package:uqido_sparkar/view/platform/mobile/accounts_tab_bar.dart';
import 'package:uqido_sparkar/view/platform/mobile/widgets/account_tab.dart';

part 'spark_ar_custom_tab_bar.viewmodel.dart';

class SparkARCustomTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SparkARCustomTabBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size(0.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: ConstrainedBox(
        //constraints: BoxConstraints.tightFor(width: 85.w),
        constraints: BoxConstraints.tightFor(width: 1532),
          child:Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 100.0, 0.0),
          child: "Good Evening".h1,
        ),
        Padding(
          child: "Accounts".h2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        Center(child:const AccountsTabBar()),
        const SizedBox(
          height: 8,
        )
      ])),
      preferredSize: preferredSize,
    );
  }
}
