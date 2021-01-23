import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/sparkar/user_effects_detail.dart';

import 'desktop_navigation_rail.dart';

class DesktopHomePage extends StatelessWidget {
  final SparkARState state;
  final List<NavigationRailDestination> destinations;
  final Widget appBar;
  final bool isTablet;

  const DesktopHomePage(
      this.state, this.appBar, this.destinations, this.isTablet)
      : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Row(children: [
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
                    child: IntrinsicHeight(
                        child: state.userList.length != 0
                            ? DesktopNavigationRail(
                                destinations, state, isTablet)
                            : Material(
                                color: Color.fromRGBO(48, 54, 60, .9),
                                elevation: 4,
                                child: SizedBox(
                                  width: isTablet ? 92 : 350,
                                ),
                              )),
                  ),
                ),
              );
            },
          ), //,
          state.userList.length != 0
              ? Expanded(
                  child: UserEffectDetail(state.userList[state.selectedIndex]))
              : SizedBox()
        ]));
  }
}
