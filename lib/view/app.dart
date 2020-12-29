import 'dart:async';

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/utils/string_extension.dart';
import 'package:uqido_sparkar/view/common/search_app_bar.dart';
import 'package:uqido_sparkar/view/platform/desktop_home_page.dart';
import 'package:uqido_sparkar/view/platform/mobile_home_page.dart';

import 'common/app_theme.dart';
import 'common/logging.dart';

class App extends StatelessWidget {
  final ValueNotifier<bool> extended = new ValueNotifier(false);

  App();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SparkARBloc(),
        child: MaterialApp(
            builder: (context, widget) => ResponsiveWrapper.builder(
                    BouncingScrollWrapper.builder(context, widget),
                    breakpoints: [
                      ResponsiveBreakpoint.resize(450, name: MOBILE),
                      ResponsiveBreakpoint.autoScale(800,
                          scaleFactor: 0.8, name: TABLET),
                      ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ]),
            theme: getTheme(),
            home: Builder(builder: (ctx) {
              return HookBuilder(builder: (ctx) {
                printOnlyDebug('Body HookBuilder');
                final state = useBloc<SparkARBloc, SparkARState>(
                  onEmitted: (_, prev, curr) {
                    printOnlyDebug(curr);
                    //return prev.userList != curr.userList;
                    return true;
                  },
                ).state;

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
                      state, generateSearchAppBar(ctx), destinations, isTablet);
                } else {
                  return MobileHomePage(
                      state, generateSearchAppBar(ctx), destinations);
                }
              });
            })));
  }

  SearchAppBar generateSearchAppBar(BuildContext ctx) {
    return SearchAppBar(
        primary: Theme.of(ctx).primaryColor,
        searchHint: "Cerca un effetto...",
        mainTextColor: Colors.white,
        onSubmit: (String value) {
          ctx.read<SparkARBloc>().add(SparkARSearchAction(value));
        },
        //Will show when SEARCH MODE wasn't active
        mainAppBar: (stream, keyword) {
          return generateMainAppBar(stream);
        });
  }

  AppBar generateMainAppBar(StreamController<bool> stream) {
    return AppBar(
        title: const Text('Uqido Spark AR'),
        actions: [
          IconButton(
            onPressed: () {
              stream.add(true);
            },
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        bottom: getAppBarLoadingBar());
  }

  PreferredSize getAppBarLoadingBar() {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 1.0),
        child: HookBuilder(builder: (ctx) {
          final state = useBloc<SparkARBloc, SparkARState>(
            onEmitted: (_, prev, curr) {
              return prev.isLoading != curr.isLoading;
            },
          ).state;
          return AnimatedOpacity(
              opacity: state.isLoading ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutQuint,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                    const Color.fromRGBO(78, 86, 196, 1.0)),
              ));
        }));
  }
}

/// Returns a boolean if we are on a medium or larger screen. Used to
/// build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) =>
    getWindowType(context) >= AdaptiveWindowType.medium;

/// Returns true if the window size is medium size. Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return getWindowType(context) == AdaptiveWindowType.medium;
}
