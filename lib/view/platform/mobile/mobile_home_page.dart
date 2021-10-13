import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/extensions.dart';
import 'package:uqido_sparkar/view/common/login_page.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_effects_grid.dart';
import 'package:uqido_sparkar/view/platform/mobile/spark_ar_custom_tab_bar.dart';

part 'mobile_home_page.g.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage() : super(key: null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SparkARBloc, SparkARState>(builder: (context, state) {
      return state.map(
          valid: (state) =>
              MobileHomePageTabController(state.userList, state.selected),
          logout: (state) => Scaffold(body: const LoginPage()),
          loading: (state) => Scaffold(body: Center(child: "Loading".h2)),
          error: (state) => Scaffold(body: Center(child: "Error".h2)));
    });
  }
}

@swidget
Widget mobileHomePageTabController(
    BuildContext context, List<SparkARUser> users, int selected) {
  return DefaultTabController(
      length: users.length,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(220),
              child: MobileHomePageAppBar(users)),
          body: MobileHomePageBody(users, selected)));
}

@swidget
Widget mobileHomePageAppBar(BuildContext context, List<SparkARUser> users) {
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
    bottom: SparkARCustomTabBar(
      accounts: users,
    ),
  );
}

@swidget
Widget mobileHomePageBody(
    BuildContext context, List<SparkARUser> users, int selected) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        child: "Effects".h2,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
      Expanded(
          child: TabBarView(
        children: [...users.map((e) => MobileEffectsGrid(e.effects))],
      ))
    ],
  );
}
