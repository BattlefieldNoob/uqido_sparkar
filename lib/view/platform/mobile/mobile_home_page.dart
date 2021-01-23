import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uqido_sparkar/blocs/sparkar_bloc.state.dart';
import 'package:uqido_sparkar/view/sparkar/user_effects_detail.dart';

import 'mobile_bottom_sheet_body.dart';

class MobileHomePage extends StatelessWidget {
  final List<NavigationRailDestination> destinations;
  final Widget appBar;
  final SparkARState state;

  MobileHomePage(this.state, this.appBar, this.destinations) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final scaffoldBody = state.userList.length != 0
        ? UserEffectDetail(state.userList[state.selected])
        : SizedBox();

    final bottomAppBarTitle = Text(
      state.userList[state.selected].name,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );

    return Scaffold(
      extendBody: true,
      appBar: appBar,
      body: scaffoldBody,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        child: Container(
          height: kToolbarHeight,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(Icons.arrow_drop_up),
                    label: Text("Account"),
                    onPressed: () => showBottomDrawer(context, state),
                  )),
              Center(
                  child:
                      state.userList.length != 0 ? bottomAppBarTitle : Text(""))
            ],
          ),
        ),
      ),
    );
  }

  void showBottomDrawer(final BuildContext context, final SparkARState state) {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) => MobileBottomSheetBody(state));
  }
}
