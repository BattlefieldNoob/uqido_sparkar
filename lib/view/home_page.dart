import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/utils/string_extension.dart';
import 'package:uqido_sparkar/utils/ui_utils.dart';
import 'package:uqido_sparkar/view/platform/desktop/desktop_home_page.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_home_page.dart';

import 'common/logging.dart';

class HomePage extends StatelessWidget {
  final List<SparkARUser> userList;
  final int selected;

  HomePage(this.userList, this.selected);

  @override
  Widget build(BuildContext context) {
    printOnlyDebug('Body HookBuilder');

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

    final isDesktop = isDisplayDesktop(context);
    final isTablet = isDisplaySmallDesktop(context);
    if (isDesktop) {
      return DesktopHomePage(userList, selected, destinations, isTablet);
    } else {
      return MobileHomePage(userList);
    }
  }
}
