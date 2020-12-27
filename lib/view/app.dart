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
import 'package:uqido_sparkar/view/widgets/navigation_rail_header.dart';
import 'package:uqido_sparkar/view/widgets/search_app_bar.dart';

import 'mobile_nav_style.dart';
import 'user_effects_detail.dart';

class App extends StatelessWidget {
  final ValueNotifier<bool> extended = new ValueNotifier(false);

  App();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SparkARBloc(),
        child: MaterialApp(
            routes: {'/': (context) => generateHome()},
            initialRoute: '/',
            builder: (context, widget) => ResponsiveWrapper.builder(
                    BouncingScrollWrapper.builder(context, widget),
                    breakpoints: [
                      ResponsiveBreakpoint.resize(450, name: MOBILE),
                      ResponsiveBreakpoint.autoScale(800,
                          scaleFactor: 0.8, name: TABLET),
                      ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ]),
            theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Color.fromRGBO(38, 44, 50, .9),
                backgroundColor: Color.fromRGBO(30, 38, 45, .9),
                accentColor: Color.fromRGBO(78, 86, 176, 1.0))));
  }

  SearchAppBar generateSearchAppBar(BuildContext ctx, bool isTabletOrGreater) {
    return SearchAppBar(
        primary: Theme.of(ctx).primaryColor,
        searchHint: "Cerca un effetto...",
        mainTextColor: Colors.white,
        onSubmit: (String value) {
          print(value);
          ctx.read<SparkARBloc>().add(SparkARSearchAction(value));
        },
        //Will show when SEARCH MODE wasn't active
        mainAppBar: (stream, keyword) {
          return generateMainAppBar(stream, isTabletOrGreater);
        });
  }

  AppBar generateMainAppBar(
      StreamController<bool> stream, bool isTabletOrGreater) {
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
        automaticallyImplyLeading: !isTabletOrGreater,
        bottom: getAppBarLoadingBar());
  }

  Widget generateHome() {
    return Builder(builder: (ctx) {
      return HookBuilder(builder: (ctx) {
        print('Body HookBuilder');
        final state = useBloc<SparkARBloc, SparkARState>(
          onEmitted: (_, prev, curr) {
            print(curr);
            //return prev.userList != curr.userList;
            return true;
          },
        ).state;

        if (state.userList.length == 0) return SizedBox();

        var destinations = state.userList
            .map((e) => NavigationRailDestination(
                icon: Image.network(e.iconUrl),
                label: Text(e.name.truncateTo(20))))
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
          return desktopNavRail(ctx, destinations, state);
        } else {
          return mobileNavRail(ctx, destinations, state);
        }
      });
    });
  }

  Widget mobileNavRail(BuildContext ctx,
      List<NavigationRailDestination> destinations, SparkARState state) {
    return MobileNav(
      selectedIndex: 0,
      destinations: destinations,
      onItemTapped: (a, b) {
        print("tapped $a,$b");
        ctx.read<SparkARBloc>().add(SparkARSelectUserAction(a));
      },
      appbar: generateSearchAppBar(ctx, false),
      state: state,
    );
  }

  Scaffold desktopNavRail(BuildContext ctx,
      List<NavigationRailDestination> destinations, SparkARState state) {
    return Scaffold(
        appBar: generateSearchAppBar(ctx, false),
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
                      child: ValueListenableBuilder<bool>(
                          valueListenable: extended,
                          builder: (context, value, child) {
                            return NavigationRail(
                                destinations: destinations,
                                extended: extended.value,
                                leading: NavigationRailHeader(
                                  extended: extended,
                                ),
                                labelType: NavigationRailLabelType.none,
                                onDestinationSelected: (index) => ctx
                                    .read<SparkARBloc>()
                                    .add(SparkARSelectUserAction(index)),
                                selectedIndex: state.selectedIndex);
                          }),
                    ),
                  ),
                ),
              );
            },
          ), //,
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: UserEffectDetail(state.userList[state.selectedIndex]))
        ]));
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
