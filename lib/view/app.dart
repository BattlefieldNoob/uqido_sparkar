import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:responsive_scaffold/templates/list/responsive_list.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/utils/string_extension.dart';
import 'package:uqido_sparkar/view/widgets/search_app_bar.dart';

import 'user_effects_detail.dart';
import 'widgets/navigation_rail.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SparkARBloc(),
        child: MaterialApp(
            routes: {
              '/': (context) => generateHome(),
              '/test': (context) => generateMasterDetail()
            },
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

        return NavRail(
            drawerHeaderBuilder: (context) {
              return Column(
                children: <Widget>[],
              );
            },
            title: const Text('Uqido Spark AR'),
            appBar: generateSearchAppBar(ctx),
            /*floatingActionButton: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.search),
                  ),*/
            onTap: (index) {
              ctx.read<SparkARBloc>().add(SparkARSelectUserAction(index));
            },
            currentIndex: state.selectedIndex,
            tabs: state.userList
                .map((e) => BottomNavigationBarItem(
                    icon: Image.network(e.iconUrl),
                    label: e.name.toLowerCapitalize()))
                .toList(),
            body: UserEffectDetail(state.userList[state.selectedIndex]));
      });
    });
  }

  SearchAppBar generateSearchAppBar(BuildContext ctx) {
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
        automaticallyImplyLeading: false,
        bottom: getAppBarLoadingBar());
  }

  Widget generateMasterDetail() {
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

        return ResponsiveListScaffold.builder(
          detailBuilder: (context, index, tablet) {
            return DetailsScreen(
                body: Scaffold(
                    appBar: generateSearchAppBar(ctx),
                    body: UserEffectDetail(state.userList[index])));
          },
          nullItems: Center(child: CircularProgressIndicator()),
          emptyItems: Center(child: Text("No Items Found")),
          appBar: AppBar(
            title: const Text("Uqido SparkAR"),
          ),
          tabletItemNotSelected: Center(child: Text("Seleziona un account")),
          itemCount: state.userList.length,
          backgroundColor: Theme.of(ctx).backgroundColor,
          itemBuilder: (context, index) {
            var current = state.userList[index];
            return ListTile(
                title: Text(current.name),
                subtitle: Text("${current.effects.length} effetti"),
                leading: Image.network(
                  current.iconUrl,
                  width: 48,
                  height: 48,
                ));
          },
        );
      });
    });
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
