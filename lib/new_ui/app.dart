import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/db/sparkar_db.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/common/login_page.dart';
import 'package:uqido_sparkar/view/sparkar/effect_list_item.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.light().copyWith(
        iconTheme: IconThemeData(color: Colors.blueGrey.shade900),
        accentIconTheme: IconThemeData(color: Colors.blueGrey.shade900),
        primaryIconTheme: IconThemeData(color: Colors.blueGrey.shade900),
        primaryTextTheme:
            Typography.material2018(platform: TargetPlatform.android).black);

    return BlocProvider(
        create: (_) => SparkARBloc([
              SparkARDB.getInstance(),
            ]),
        child: MaterialApp(
            theme: theme,
            home: BlocBuilder<SparkARBloc, SparkARState>(builder: (ctx, state) {
              //return state.maybeMap(
              //   orElse: () => HomePage(),
              //logout: (state) => LoginPage());

              final a = state.maybeMap(orElse:() => null, logout: (s) => LoginPage());

              if(a!=null)
                return a;

              final users = state.maybeMap(
                  orElse: () => null, valid: (valid) => valid.networkUserList);

              if (users == null) return Container();

              return DefaultTabController(
                  length: users.length,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(260),
                      child: AppBar(
                        automaticallyImplyLeading: false,
                        leading: Icon(Icons.menu),
                        actions: [Icon(Icons.account_circle)],
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        elevation: 0,
                        bottom: SparkARCustomTabBar(
                          accounts: users,
                        ),
                      ),
                    ),
                    body: AppBody(
                      accounts: users,
                    ),
                  ));
            })));
  }
}

class AppBody extends StatelessWidget {
  const AppBody({
    Key? key,
    required this.accounts,
  }) : super(key: key);

  final List<SparkARUser> accounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          child: Text("Effects",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey.shade800)),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        ),
        Expanded(
            child: TabBarView(
          children: [...accounts.map((e) => userToGridView(e))],
        ))
      ],
    );
  }
}

class SparkARCustomTabBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SparkARCustomTabBar({
    Key? key,
    required this.accounts,
  }) : super(key: key);

  @override
  Size get preferredSize => Size(0.0, 80.0);

  final List<SparkARUser> accounts;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 100.0, 0.0),
          child: Text(
            "Good Evening, Christopher",
            style: TextStyle(
              color: Colors.blueGrey.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          child: Text("Accounts",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey.shade800)),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        TabBar(
          isScrollable: true,
          tabs: [...accounts.map((e) => userToTab(e))],
          indicatorSize: TabBarIndicatorSize.label,
        )
      ]),
      preferredSize: Size(0.0, 80.0),
    );
  }
}

Tab userToTab(SparkARUser user) {
  return Tab(
    icon: Image.network(
      user.iconUrl,
      width: 42,
      height: 42,
    ),
    text: user.name,
  );
}

FutureBuilder<PaletteGenerator> userToGridView(SparkARUser user) {
  final paletteFuture = PaletteGenerator.fromImageProvider(NetworkImage(user.iconUrl));

  return FutureBuilder(
      future: paletteFuture,
      builder:
          (BuildContext context, AsyncSnapshot<PaletteGenerator> snapshot) {
        if (snapshot.hasError) {
          return GridView(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
              children: [
                ...user.effects.map((e) =>
                    EffectListItem(effect: e, tileColor: Colors.amberAccent.shade100))
              ]);
        } else if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else {
          final color = snapshot.data?.dominantColor?.color ?? Colors.red;

          return GridView(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
            children: [
              ...user.effects
                  .map((e) => EffectListItem(effect: e, tileColor: color))
            ],
          );
        }
      });
}
