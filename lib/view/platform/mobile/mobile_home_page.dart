import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/providers/spark_ar_data_provider.dart';
import 'package:uqido_sparkar/utils/extensions.dart';
import 'package:uqido_sparkar/view/common/login_page.dart';
import 'package:uqido_sparkar/view/platform/mobile/accounts_tab_bar_view.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_effects_grid.dart';
import 'package:uqido_sparkar/view/platform/mobile/spark_ar_custom_tab_bar.dart';

part 'mobile_home_page.g.dart';

class MobileHomePage extends ConsumerWidget {
  const MobileHomePage() : super(key: null);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersCount);
    return DefaultTabController(
        length: users,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(220),
                child: const MobileHomePageAppBar()),
            body: const MobileHomePageBody()));
  }
}

@swidget
Widget mobileHomePageAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: const Icon(Icons.menu),
    actions: [
      Padding(
          padding: EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () => {}, icon: const Icon(Icons.account_circle)))
    ],
    elevation: 0,
    bottom: SparkARCustomTabBar(),
  );
}

@swidget
Widget mobileHomePageBody(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        child: "Effects".h2,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
      Expanded(child: const AccountsTabBarView())
    ],
  );
}
