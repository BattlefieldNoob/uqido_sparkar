import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';

import 'common/navigation_rail.dart';
import 'desktop/home_page_desktop.dart' deferred as desktopPage;
import 'desktop/user_effects_detail.dart';
import 'mobile/home_page_mobile.dart' deferred as mobilePage;

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, widget),
                breakpoints: [
                  ResponsiveBreakpoint.resize(450, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800,
                      scaleFactor: 0.8, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ]),
        theme: ThemeData.dark(),
        home: BlocProvider(
            create: (_) => SparkARBloc(),
            child: Builder(builder: (ctx) {
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

                return NavRail(
                    drawerWidth: 300,
                    drawerHeaderBuilder: (context) {
                      return Column(
                        children: <Widget>[],
                      );
                    },
                    title: const Text('Uqido Spark AR'),
                    onTap: (index) {
                      ctx
                          .read<SparkARBloc>()
                          .add(SparkARSelectUserAction(index));
                    },
                    currentIndex: state.selectedIndex,
                    tabs: state.userList
                        .map((e) => BottomNavigationBarItem(
                            icon: Image.network(e.iconUrl), label: e.name))
                        .toList(),
                    body: Container(
                        color: const Color.fromRGBO(58, 66, 86, 1.0),
                        child: UserEffectDetail(
                            state.userList[state.selectedIndex])));
              });

              /*BlocProvider(
            create: (_) => SparkARBloc(),
            child: Builder(builder: (ctx) {
              return Scaffold(
                  backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
                  appBar: SearchAppBar(
                      primary: Theme.of(ctx).primaryColor,
                      searchHint: "Cerca un effetto...",
                      mainTextColor: Colors.white,
                      onSubmit: (String value) {
                        print(value);
                        ctx.read<SparkARBloc>().add(SparkARSearchAction(value));
                      },
                      //Will show when SEARCH MODE wasn't active
                      mainAppBar: (stream, keyword) {
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
                      }),
                  body: HookBuilder(builder: (ctx) {
                    print('Body HookBuilder');
                    final state = useBloc<SparkARBloc, SparkARState>(
                      onEmitted: (_, prev, curr) {
                        print(curr);
                        return prev.userList != curr.userList;
                      },
                    ).state;

                    if (state.userList.length == 0) return SizedBox();

                    return HomePageProvider(
                      desktopScreen: loadHomePageDesktop(state),
                      mobileScreen: loadHomePageMobile(state),
                    );
                  }));
            }))*/
            })));
  }

  Future<Widget> loadHomePageDesktop(SparkARState state) async {
    await desktopPage.loadLibrary();
    return desktopPage.HomePageDesktop(state);
  }

  Future<Widget> loadHomePageMobile(SparkARState state) async {
    await mobilePage.loadLibrary();
    return mobilePage.HomePageMobile(state);
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
