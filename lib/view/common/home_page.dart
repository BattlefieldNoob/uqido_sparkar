import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/utils/string_extension.dart';
import 'package:uqido_sparkar/utils/ui_utils.dart';
import 'package:uqido_sparkar/view/platform/desktop/desktop_home_page.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_home_page.dart';

import 'home_app_bar.dart';
import 'logging.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) {
      return BlocBuilder<SparkARBloc, SparkARState>(
          buildWhen: (previous, current) => true,
          builder: (ctx, state) {
            printOnlyDebug('Body HookBuilder');

            var destinations = state.userList
                .map((e) => NavigationRailDestination(
                    icon: Image.network(e.iconUrl),
                    label: Text(e.name.truncateTo(30))))
                .toList();

            while (destinations.length < 2) {
              destinations.add(NavigationRailDestination(
                  icon: Opacity(opacity: 0),
                  label: Opacity(
                    opacity: 0,
                  )));
            }

            final isDesktop = isDisplayDesktop(ctx);
            final isTablet = isDisplaySmallDesktop(ctx);
            if (isDesktop) {
              return DesktopHomePage(
                  state, HomeAppBar(), destinations, isTablet);
            } else {
              return MobileHomePage(state, HomeAppBar(), destinations);
            }
          });
    });
  }
}
