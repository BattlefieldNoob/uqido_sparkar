import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/model/sparkar_user.dart';
import 'package:uqido_sparkar/view/platform/mobile/mobile_effects_grid.dart';
import 'package:uqido_sparkar/view/platform/mobile/spark_ar_custom_tab_bar.dart';

class MobileHomePage extends StatelessWidget {
  final List<SparkARUser> users;

  MobileHomePage(this.users) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: users.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(260),
            child: AppBar(
              automaticallyImplyLeading: false,
              leading: Icon(Icons.menu),
              actions: [Icon(Icons.account_circle)],
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          children: [...accounts.map((e) => MobileEffectsGrid(e))],
        ))
      ],
    );
  }
}
