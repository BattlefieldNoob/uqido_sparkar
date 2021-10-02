import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/string_extension.dart';
import 'package:uqido_sparkar/view/common/home_app_bar.dart';
import 'package:uqido_sparkar/view/common/login_page.dart';
import 'package:uqido_sparkar/view/sparkar/user_effects_detail.dart';

import 'desktop_navigation_rail.dart';

part 'desktop_home_page.g.dart';

class DesktopHomePage extends StatelessWidget {
  final bool isTablet;

  const DesktopHomePage(this.isTablet) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(),
        body: BlocBuilder<SparkARBloc, SparkARState>(
          builder: (context, state) {
            return state.map(
                valid: (state) => DesktopHomePageBody(
                    state.userList, state.selected, isTablet),
                logout: (state) => const LoginPage(),
                loading: (state) => const Center(child: const Text("Loading")),
                error: (state) => const Center(child: const Text("Error")));
          },
        ));
  }
}

@swidget
Widget desktopHomePageBody(
    List<SparkARUser> userList, int selected, bool isTablet) {
  var destinations = userList
      .map((e) => NavigationRailDestination(
          icon: Image.network(e.iconUrl), label: Text(e.name.truncateTo(30))))
      .toList();

  while (destinations.length < 2) {
    destinations.add(NavigationRailDestination(
        icon: Opacity(opacity: 0),
        label: Opacity(
          opacity: 0,
        )));
  }

  final navigationRail =
      DesktopNavigationRail(destinations, selected, isTablet);

  final scaffoldDetail = selected >= 0
      ? Expanded(child: UserEffectDetail(userList[selected]))
      : const SizedBox();

  return Row(children: [
    LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Theme.of(context).navigationRailTheme.backgroundColor,
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(child: navigationRail),
            ),
          ),
        );
      },
    ), //,
    scaffoldDetail
  ]);
}
