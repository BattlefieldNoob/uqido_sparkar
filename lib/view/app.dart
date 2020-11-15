import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_bloc/flutter_hooks_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/view/search_app_bar.dart';

import 'desktop/home_page_desktop.dart';
import 'mobile/home_page_mobile.dart';

class EffectsSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: BackButtonIcon(),
        onPressed: () {
          close(context, "cavallo");
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: BackButtonIcon(),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => Opacity(
        opacity: 0,
        child: Container(),
      );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: BlocProvider(
            create: (_) => SparkARBloc(),
            child: HookBuilder(builder: (ctx) {
              final state = useBloc<SparkARBloc, SparkARState>(
                onEmitted: (_, prev, curr) {
                  return prev.userList != curr.userList;
                },
              ).state;
              return Scaffold(
                  backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
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
                            title: Text(
                                'Uqido Spark AR ${state.searchKey.isNotEmpty ? "(searching ${state.searchKey})" : ""}'),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  stream.add(true);
                                },
                                icon: Icon(Icons.search),
                              )
                            ],
                            bottom: getAppBarLoadingBar());
                      }),
                  body: RefreshIndicator(
                      onRefresh: () async =>
                          ctx.read<SparkARBloc>().add(SparkARUpdateAction()),
                      child: LayoutBuilder(builder: (context, constraints) {
                        final ratio =
                            constraints.maxWidth / constraints.maxHeight;
                        print("Ratio:" + ratio.toString());
                        return ratio > 1.4
                            ? HomePageDesktop(state)
                            : HomePageMobile(state);
                      })));
            })));
    ;
  }

  PreferredSize getAppBarLoadingBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 1.0),
        child: HookBuilder(builder: (ctx) {
          final state = useBloc<SparkARBloc, SparkARState>(
            onEmitted: (_, prev, curr) {
              return prev.isLoading != curr.isLoading;
            },
          ).state;
          return AnimatedOpacity(
              opacity: state.isLoading ? 1 : 0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutQuint,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(78, 86, 196, 1.0)),
              ));
        }));
  }
}